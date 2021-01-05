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
import com.beer.macSim.member.model.vo.Member;

@Controller
public class CommController {

	@Autowired
	private CommService cService;
	
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
			System.out.println("clikes : " + clikes);
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
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			String changeName = saveFile(session, upfile);
			
			comm.setCommOriginSrc(upfile.getOriginalFilename());
			comm.setCommChangeSrc(changeName);
			
		}
		
		System.out.println("comm.getCommCate() : " + comm.getCommCate());
		int result = cService.insertComm(comm);
		
		if(result > 0) { // 성공
			
			System.out.println("comm : " + comm);
			System.out.println("comm.getCommCate() : " + comm.getCommCate());
			String cate = "";
			switch(comm.getCommCate()) {
				case 0: cate = "맥심의 일상"; break;
				case 1: cate = "오늘의 맥주"; break;
			}
			
			System.out.println("cate : " + cate);
			session.setAttribute("alertMsg", cate + "에 글이 등록되었습니다!");

			return "redirect:list.cm?cate=" + comm.getCommCate();
			
		}else { // 실패
			model.addAttribute("errorMsg", "작성하신 글 등록에 실패하였습니다.");
			return "common/errorPage";
		}
		
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
	@RequestMapping("detail.fo") // detail.fo?fno=x
	public String selectForumDetail(int fno, HttpSession session, Model model) {

		//System.out.println("fno : " + fno);
		
		// 포럼 입장가능한지 확인
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			
			// 이미 입장한 포럼인지
//			ArrayList<> = cService.select
			
			// 첫입장이면 포인트 쓸 수 있는지
			
			// 포인트 쓸 수 있으면 사용할건지 물어보는..???????? 물어봐? 뭘물어봐 그렇다고 그냥써? 으에에에에에ㅔ
			
		}else {
			// 죽여
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
				
				model.addAttribute("fo", fo);
				model.addAttribute("rpList", rpList);
				return "community/forumDetail";
				
			}else {
				model.addAttribute("errorMsg", "존재하지 않는 포럼입니다");
				return "common/errorPage";
			}
			
//		}else {
//			살려
//		}
		
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
	
	// 포럼에 댓글 수정시 업데이트
	@ResponseBody
	@RequestMapping("replyUpdate.fo")
	public String updateReplyUpdate(int coNo, String coContent) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		Reply r = new Reply();
		r.setCoNo(coNo);
		r.setCoContent(coContent);
		int result = cService.updateReplyUpdate(r);
		
		if(result > 0) {
			return "S";
		}else {
			return "F";
		}
		
	}
	
	// 포럼에 대댓글 수정시 업데이트
	@ResponseBody
	@RequestMapping("subReplyUpdate.fo")
	public String updateSubReplyUpdate(int coNo, String coContent) {
		
		//System.out.println("coNo : " + coNo);
		//System.out.println("coContent : " + coContent);
		
		Reply r = new Reply();
		r.setCoNo(coNo);
		r.setCoContent(coContent);
		int result = cService.updateSubReplyUpdate(r);
		
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
