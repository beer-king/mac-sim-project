package com.beer.macSim.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.community.model.service.CommService;
import com.beer.macSim.community.model.vo.CommLikes;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;
import com.beer.macSim.community.model.vo.Reply;
import com.beer.macSim.community.model.vo.SubReply;
import com.beer.macSim.member.model.service.MemberService;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;
import com.google.gson.Gson;

@Controller
public class CommController {

	@Autowired
	private CommService cService;
	@Autowired
	private MemberService mService;
	
	// 커뮤니티 (맥일/오맥) 리스트 조회
	@RequestMapping("list.cm") // list.cm?cate=x&currentPage=x
	public String selectCommList(@RequestParam(value="cate", defaultValue="0") int cate,
								 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
								 HttpSession session,
								 Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		//System.out.println("Member m : " + m);
		if(m != null) {
			
			ArrayList<CommLikes> clikes = cService.selectCommLikes(m.getUserNo());
			//System.out.println("clikes : " + clikes);
		}
		
		//System.out.println("cate : " + cate);
		//System.out.println("currentPage : " + currentPage);
		
		// 페이징
		int listCount = cService.selectCommCount(cate);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		// 리스트
		ArrayList<Community> list = cService.selectCommList(cate, pi);
		
		for(Community c : list) {
			
			int cNo = c.getCommNo();
			int likeLength = cService.selectLikeLength(cNo);
			
			if( m != null) {
				
				int uNo = m.getUserNo();
				
				CommLikes cl = new CommLikes();
				cl.setUserNo(uNo);
				cl.setCommNo(cNo);
				
				int isLike = cService.selectIsLike(cl);	
				c.setIsLike(isLike);
				
			}else {
				c.setIsLike(9999999);
			}
			c.setLikeLength(likeLength);
			
		}
		
		model.addAttribute("cate", cate);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		//System.out.println("list" + list);
		
		return "community/commList";
		
	}
	
	// 커뮤니티 (맥일/오맥) 작성
	@RequestMapping("enrollForm.cm")
	public String commEnrollForm() {
		return "community/editComm";
	}
	
	@RequestMapping("insert.cm")
	public String insertComm(Community comm, MultipartFile upfile, HttpSession session, Model model) {
		
		//System.out.println("Coummnity : " + c);
		//System.out.println("upfile : " + upfile.getOriginalFilename());
		
		Member m = (Member)session.getAttribute("loginUser");
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			String changeName = saveFile(session, upfile);
			
			comm.setCommOriginSrc(upfile.getOriginalFilename());
			comm.setCommChangeSrc(changeName);
			
		}
		
		System.out.println("comm.getCommCate() : " + comm.getCommCate());
		int result = cService.insertComm(comm);
		
		if(result > 0) { // 성공
			
			// 포인트 적립해주기
			PointHistory ph = new PointHistory();
			ph.setPoint(2);
			ph.setUserNo(m.getUserNo());
			ph.setCategory("커뮤니티작성");
			ph.setPointHistory("적립");
			
			int result2 = mService.updateMemberPoint(ph);
			
			//System.out.println("comm : " + comm);
			//System.out.println("comm.getCommCate() : " + comm.getCommCate());
			String cate = "";
			switch(comm.getCommCate()) {
				case 0: cate = "맥심의 일상"; break;
				case 1: cate = "오늘의 맥주"; break;
			}
			
			System.out.println("cate : " + cate);
			if(result2 > 0) {
				session.setAttribute("alertMsg", cate + "에 글이 등록되었습니다🎉 !! (2포인트 적립)");
			}else {
				session.setAttribute("alertMsg", cate + "에 글이 등록되었습니다!");
			}

			return "redirect:list.cm?cate=" + comm.getCommCate();
			
		}else { // 실패
			model.addAttribute("errorMsg", "작성하신 글 등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	// 커뮤니티 수정
	@RequestMapping("updateForm.cm")
	public String updateFormComm(int commNo, Model model) {

		Community c = cService.updateFormComm(commNo);
		//System.out.println(c);
		
		if(c != null) { // 성공
			model.addAttribute("c", c);
			return "community/editCommUpdate";
		}else { // 실패
			model.addAttribute("errorMsg", "글 수정 페이지를 불러올 수 없습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("update.cm")
	public String updateComm(Community c, MultipartFile upfile, HttpSession session, Model model) {
		
		//System.out.println(c);
		//System.out.println(upfile.getOriginalFilename());
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			String changeName = saveFile(session, upfile);
			
			c.setCommOriginSrc(upfile.getOriginalFilename());
			c.setCommChangeSrc(changeName);
			
		}
		
		int result = cService.updateComm(c);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정되었습니다!");
			return "redirect:list.cm?cate=" + c.getCommCate();
		}else {
			model.addAttribute("errorMsg", "수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	// 커뮤니티 삭제
	@RequestMapping("delete.cm")
	public String deleteComm(int commNo, HttpSession session, Model model) {
		
		int result = cService.deleteComm(commNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "글이 삭제 되었습니다ㅠㅠ");
			return "redirect:list.cm?cate=0";
		}else {
			model.addAttribute("errorMsg", "수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	// 커뮤니티 좋아요
	@ResponseBody
	@RequestMapping(value="like.on", produces="application/json; charset=utf-8")
	public String insertCommLike(int uno, int cno) {
		
		CommLikes cl = new CommLikes();
		cl.setUserNo(uno); // 이사람이
		cl.setCommNo(cno); // 여기에 좋아요

		int result = cService.insertCommLike(cl);
		if(result > 0) {
			
			int likeLength = cService.selectLikeLength(cno);

			String json = new Gson().toJson(likeLength);
			return json;
			
		}else {
			return "F";
		}
		
	}
	
	// 커뮤니티 좋아요 취소
	@ResponseBody
	@RequestMapping(value="like.off", produces="application/json; charset=utf-8")
	public String deleteCommLike(int uno, int cno) {
		
		CommLikes cl = new CommLikes();
		cl.setUserNo(uno); // 이사람이
		cl.setCommNo(cno); // 여기에 좋아요취소

		int result = cService.deleteCommLike(cl);
		if(result > 0) {

			int likeLength = cService.selectLikeLength(cno);

			String json = new Gson().toJson(likeLength);
			return json;
			
		}else {
			return "F";
		}
		
	}
	
	// 좋아요 안돼요
	@RequestMapping("like.xx")
	public String cantClickLike(HttpSession session, int cate) {
		session.setAttribute("alertMsg", "로그인 후 이용하실 수 있습니다💛");
		return "redirect:list.cm?cate=" + cate;
	}

	// 포럼 리스트 조회
	@RequestMapping("list.fo")
	public String selectForumList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징
		int listCount = cService.selectForumCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		// 리스트
		ArrayList<Forum> list = cService.selectForumList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		//System.out.println("list : " + list);
		
		return "community/forumList";
		
	}
	
	// 포럼 상세페이지 조회
	@RequestMapping("detail.fo") // detail.fo?fno=x&uno=x
	public String selectForumDetail(int fno, int uno, HttpSession session, Model model) {

		System.out.println("fno : " + fno);
		System.out.println("uno : " + uno);
		
		// 포럼 입장가능한지 확인
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m != null) { // 로그인한 사용자
			
			// 이미 입장한 포럼인지
			PointHistory ph = new PointHistory();
			ph.setPoint(-5);
			ph.setUserNo(m.getUserNo());
			ph.setCategory("포럼입장" + fno);
			ph.setPointHistory("차감");
			System.out.println(ph);
			
			int isEnter = cService.selectForumEnter(ph);
			if(m.getUserNo() != uno && isEnter == 0) { // 다른유저꺼면서 + 처음 입장하는 포럼
				if(m.getPoint() < 5) { // 포인트가 없는사람은 바로 return되게
					session.setAttribute("alertMsg", "포인트가 부족합니다ㅠㅠ");
					return "redirect:list.fo";
				}else { // 포인트 쓸 수 있으니까 차감
					
                    int result = mService.updateMemberPoint(ph);
                    if(result > 0) {
                    }else {
            			model.addAttribute("errorMsg", "작성하신 글 등록에 실패하였습니다.");
            			return "common/errorPage";
                    }
                    
				}
			}
			
			// 포럼 입장 -->
			int result = cService.increaseCount(fno);
			
			if(result > 0) {
				
				Forum fo = cService.selectForumDetail(fno);
				
				// 댓글 가져오기
				ArrayList<Reply> rpList = cService.selectReplyList(fno);
				
				// 대댓글 가져오기
				for(Reply r : rpList) {
					ArrayList<SubReply> subList = cService.selectSubReplyList(r.getCoNo());
					r.setSubReply(subList);
				}
				
				//System.out.println("rpList : " + rpList);
				
				if(m.getUserNo() != uno && isEnter == 0) {
					session.setAttribute("alertMsg", fo.getForTitle()+" 입장을 축하합니다!🎉 이 포럼의 첫 입장으로 5포인트가 차감되었습니다.");
				}
				model.addAttribute("fo", fo);
				model.addAttribute("rpList", rpList);
				return "community/forumDetail";
				
			}else {
				model.addAttribute("errorMsg", "존재하지 않는 포럼입니다");
				return "common/errorPage";
			}
			
		}else { // 로그인 안한 사용자
			
			session.setAttribute("alertMsg", "로그인 후 입장하실 수 있습니다.");
			return "redirect:list.fo";
			
		}
		
	}
	
	// 포럼 작성
	@RequestMapping("enrollForm.fo")
	public String forumEnrollForm() {
		return "community/editForum";
	}
	
	@RequestMapping("insert.fo")
	public String insertForum(Forum fo, MultipartFile upfile, HttpSession session, Model model) {
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			String changeName = saveFile(session, upfile);
			
			fo.setForOriginSrc(upfile.getOriginalFilename());
			fo.setForChangeSrc(changeName);
			
		}
		
		int result = cService.insertForum(fo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "포럼에 글이 등록되었습니다!");
			return "redirect:list.fo";
			
		}else { // 실패
			
			model.addAttribute("errorMsg", "작성하신 글 등록에 실패하였습니다.");
			return "common/errorPage";
			
		}
		
	}
	
	// 포럼 수정
	@RequestMapping("updateForm.fo")
	public String updateFormForum(int forNo, Model model) {

		Forum f = cService.updateFormForum(forNo);
		System.out.println(f);
		
		if(f != null) { // 성공
			model.addAttribute("f", f);
			return "community/editForumUpdate";
		}else { // 실패
			model.addAttribute("errorMsg", "포럼 수정 페이지를 불러올 수 없습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("update.fo")
	public String updateForum(Forum f, MultipartFile upfile, HttpSession session, Model model) {
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			String changeName = saveFile(session, upfile);
			
			f.setForOriginSrc(upfile.getOriginalFilename());
			f.setForChangeSrc(changeName);
			
		}
		
		int result = cService.updateForum(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정되었습니다!");
			return "redirect:list.fo";
		}else {
			model.addAttribute("errorMsg", "수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	// 포럼 삭제
	@RequestMapping("delete.fo")
	public String deleteForum(int forNo, HttpSession session, Model model) {
		
		int result = cService.deleteForum(forNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "포럼이 삭제 되었습니다ㅠㅠ");
			return "redirect:list.fo";
		}else {
			model.addAttribute("errorMsg", "수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	
	// 포럼에 댓글 수정시 업데이트
	@ResponseBody
	@RequestMapping("replyUpdate.fo")
	public String replyUpdate(int coNo, String coContent) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		Reply r = new Reply();
		r.setCoNo(coNo);
		r.setCoContent(coContent);
		int result = cService.replyUpdate(r);
		
		if(result > 0) {
			return "S";
		}else {
			return "F";
		}
		
	}
	
	// 포럼에 대댓글 수정시 업데이트
	@ResponseBody
	@RequestMapping("subReplyUpdate.fo")
	public String subReplyUpdate(int coNo, String coContent) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		Reply r = new Reply();
		r.setCoNo(coNo);
		r.setCoContent(coContent);
		int result = cService.subReplyUpdate(r);
		
		if(result > 0) {
			return "S";
		}else {
			return "F";
		}
		
	}

	// 포럼에 댓글 삭제시 업데이트
	@ResponseBody
	@RequestMapping("replyDelete.fo")
	public String replyDelete(int coNo) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		int result = cService.replyDelete(coNo);
		
		if(result > 0) {
			return "S";
		}else {
			return "F";
		}
		
	}

	// 포럼에 대댓글 삭제시 업데이트
	@ResponseBody
	@RequestMapping("subReplyDelete.fo")
	public String subReplyDelete(int coNo) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		int result = cService.subReplyDelete(coNo);
		
		if(result > 0) {
			return "S";
		}else {
			return "F";
		}
		
	}
	
	// 포럼에 댓글 작성
	@ResponseBody
	@RequestMapping(value="replyInsert.fo", produces="application/json; charset=utf-8")
	public String replyInsert(HttpSession session,int fno, String coContent) {
		
		Member m = (Member)session.getAttribute("loginUser");

		//System.out.println(m);
		//System.out.println(fno);
				
		Reply r = new Reply();
		r.setForNo(fno); 			// 무슨 포럼에 대한 댓글인지
		r.setUserNo(m.getUserNo());	// 댓글 작성자
		r.setCoContent(coContent);	// insert하려는 댓글
		
		//System.out.println(r);
		int result = cService.replyInsert(r);
		
		if(result > 0) {
			
			ArrayList<Reply> rNew = cService.selectReplyOne(r);
			//System.out.println(rNew);
			String json = new Gson().toJson(rNew);
			return json;
		}else {
			return "F";
		}		
		
	}
	
	// 포럼에 대댓글 작성
	@ResponseBody
	@RequestMapping(value="subReplyInsert.fo", produces="application/json; charset=utf-8")
	public String subReplyInsert(HttpSession session, int fno, String cno, String sId, String coContent) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		Reply r = new Reply();
		r.setForNo(fno);
		r.setCoNo(Integer.parseInt(cno));
		r.setUserId(sId);
		r.setCoContent(coContent);
		
		//System.out.println(r);
		int result = cService.subReplyInsert(r);
		
		if(result > 0) {
			
			ArrayList<SubReply> rNew = cService.selectSubReplyOne(r);
			//System.out.println(rNew);
			String json = new Gson().toJson(rNew);
			return json;
			
		}else {
			return "F";
		}		
		
	}
	
	
	// 첨부파일 업로드 시켜주는 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
}
