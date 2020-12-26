package com.beer.macSim.administer.controller;

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

import com.beer.macSim.administer.model.service.AdminService;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.common.template.Selectation;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;


@Controller
public class AdministerController {
	@Autowired
	private AdminService aService;
	
	//신고관리
	@RequestMapping("callAd.ad")
	public String goCall(@RequestParam(value="currentPage", defaultValue="1")int currentPage, @RequestParam(value="category", defaultValue="1")int category, @RequestParam(value="status", defaultValue="A")String status, Model model) {
		model.addAttribute("category",category);
		System.out.println("test2");
		System.out.println(category);
		if(category == 4) {
			int listCount = aService.selectUserListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Member> rlist = aService.selectUserList(pi);
			model.addAttribute("pi", pi);
			model.addAttribute("rlist", rlist);
			System.out.println("test3");
		}else {
			SelectData sd = Selectation.getSelectData(category, status);
			int listCount = aService.selectCallListCount(sd);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Report> rlist = aService.selectCallList(pi, sd);
			for(Report r : rlist) {
				System.out.println("test");
				System.out.println(r);
			}
			model.addAttribute("pi", pi);
			model.addAttribute("rlist", rlist);
		}
		return "administer/callAdmini";
	}
	
	
	
	
	
	
	
	
	
	
	//비어관리
	@RequestMapping("beerAd.ad")
	public String goBeer(@RequestParam(value="category", defaultValue="1")int category, Model model) {
		model.addAttribute("category",category);
		return "administer/beerAdmini";
	}
	
	
	//공지사항 관리
	@RequestMapping("noticeAd.ad")
	public String goNotice(@RequestParam(value="currentPage", defaultValue="1")int currentPage,@RequestParam(value="category", defaultValue="1")int category, Model model) {
		model.addAttribute("category",category);
		if(category == 1) {
			int listCount = aService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Notice> list = aService.selectNoticeList(pi);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		return "administer/noticeAdmini";
	}
	@RequestMapping("enrollBeer.ad")
	public String enrollBeer(Beers b, Member m, MultipartFile upfile, HttpSession session, Model model) {
		String changeName = saveFile(session, upfile);
		
		b.setOriginName(upfile.getOriginalFilename());
		b.setChangeName("resources/uploadFiles/" + changeName);
		
		int result = aService.insertBeer(b, m);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:beerAd.ad";
			
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("enrollNotice.ad")
	public String enrollNotice(Notice n, HttpSession session, Model model) {
		int result = aService.insertNotice(n);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:noticeAd.ad";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("goUpdateNotice.ad")
	public String goUpdateNotice(String noticeNo, Model model) {
		Notice n = aService.selectNotice(noticeNo);
		model.addAttribute("n",n);
		return "administer/noticeUpdataAdmini";
	}
	
	@RequestMapping("updateNotice.ad")
	public String updateNotice(Notice n, HttpSession session, Model model) {
		int result = aService.updateNotice(n);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:noticeAd.ad";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("noticeDelete.ad")
	public String deleteNotice(String noticeNo) {
		int result = aService.deleteNotice(noticeNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
	
	//일반 함수
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		// 파일을 업로드 시킬 폴더의 물리적인 경로 (savePath)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 어떤 이름으로 업로드 시킬껀지의 수정명 (changeName)
		String originName = upfile.getOriginalFilename(); // flower.png
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext; // 
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
}
