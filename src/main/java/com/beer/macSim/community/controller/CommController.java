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
import org.springframework.web.multipart.MultipartFile;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.community.model.service.CommService;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;

@Controller
public class CommController {

	@Autowired
	private CommService cService;
	
	// 커뮤니티 (맥일/오맥) 리스트 조회
	@RequestMapping("list.cm") // list.cm?cate=x&currentPage=x
	public String selectCommList(@RequestParam(value="cate", defaultValue="0") int cate,
								 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
								 Model model) {
		
		//System.out.println("cate : " + cate);
		//System.out.println("currentPage : " + currentPage);
		
		// 페이징
		int listCount = cService.selectCommCount(cate);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		// 리스트
		ArrayList<Community> list = cService.selectCommList(cate, pi);
		
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
	public String selectForumDetail(int fno, Model model) {

		System.out.println("fno : " + fno);
		
		int result = cService.increaseCount(fno);
		
		if(result > 0) {
			
			Forum fo = cService.selectForumDetail(fno);
			
			// 댓글 가져오기
			
			model.addAttribute("fo", fo);
			// 댓글가져온거 model에
			return "community/forumDetail";
			
		}else {
			model.addAttribute("errorMsg", "존재하지 않는 포럼입니다");
			return "common/errorPage";
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
