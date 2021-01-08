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
import com.beer.macSim.administer.model.vo.Batch;
import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.GbRequest;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.BatchProcess;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.common.template.Search;
import com.beer.macSim.common.template.Selectation;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
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
		model.addAttribute("status", status);
		if(category == 4) {
			int Ustatus = 0;
			if(status.equals("B")) {
				Ustatus = 1;
			}
			int listCount = aService.selectUserListCount(Ustatus);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
			ArrayList<Member> ulist = aService.selectUserList(pi, Ustatus);
			model.addAttribute("pi", pi);
			model.addAttribute("ulist", ulist);
		}else {
			SelectData sd = Selectation.getSelectData(category, status);
			int listCount = aService.selectCallListCount(sd);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
			ArrayList<Report> rlist = aService.selectCallList(pi, sd);
			model.addAttribute("pi", pi);
			model.addAttribute("rlist", rlist);
		}
		return "administer/callAdmini";
	}
	
	
	@ResponseBody
	@RequestMapping("userBan.ad")
	public String userBan(String userNo) {
		int result = aService.userBan(userNo);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("reportB.ad")
	public String reportB(String reqNo) {
		
		SelectData sd = Selectation.getSelectData(Integer.parseInt(reqNo), "B");
		int result = aService.reportBC(sd);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("reportC.ad")
	public String reportC(String reqNo) {
		SelectData sd = Selectation.getSelectData(Integer.parseInt(reqNo), "C");
		int result = aService.reportBC(sd);
		
		//이벤트, 커뮤니티, 포럼, 비어리뷰 완성후 돌아갈 함수
		//Report r = aService.selectCallOne(Integer.parseInt(reqNo));
		//int result2 = aService.deleteBoard(Report r);
		
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("processReport.ad")
	public String processReport(@RequestParam(value = "list[]") ArrayList<String> list, String Astatus) {
		Batch b = BatchProcess.getBatch(list, Astatus, null);
		int result = aService.updateBatchReport(b);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
	//비어관리
	@RequestMapping("beerAd.ad")
	public String goBeer(@RequestParam(value="currentPage", defaultValue="1")int currentPage, @RequestParam(value="category", defaultValue="1")int category, Model model, String sort, String search) {
		model.addAttribute("category",category);
		model.addAttribute("sort", sort);
		if(category == 2) {
			BeerSearch bs = Search.getBeerSearch(sort, search);
			int listCount = aService.selectBeerListCount(bs);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Beers> blist= aService.selectBeerList(bs, pi);
			model.addAttribute("pi", pi);
			model.addAttribute("blist", blist);
		}
		return "administer/beerAdmini";
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
	
	@RequestMapping("beerUpdate.ad")
	public String goUpdate(Model model, String beerNo) {
		Beers b = aService.selectBeerOne(beerNo);
		model.addAttribute("b", b);
		return "administer/beerUpdate";
	}
	
	@RequestMapping("updateBeer.ad")
	public String updateBeer(Beers b, MultipartFile upfile, HttpSession session, Model model, Member m) {
		Beers b2 = aService.selectBeerOne(Integer.toString(b.getBeerNo()));
		String changeName;
		if(upfile.getOriginalFilename().isEmpty()) {
			b.setOriginName(b2.getOriginName());
			b.setChangeName(b2.getChangeName());
		}else {
			changeName = saveFile(session, upfile);
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
		m.setPoint(10);
		int result = aService.updateBeer(b, m);
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 업데이트 되었습니다.");
			return "redirect:beerAd.ad?category=2";
			
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 업데이트 실패!");
			return "common/errorPage";
		}
	}
	
	
	
	
	//공지사항 관리
	@RequestMapping("noticeAd.ad")
	public String goNotice(@RequestParam(value="currentPage", defaultValue="1")int currentPage,@RequestParam(value="category", defaultValue="1")int category, Model model, String cate, String search) {
		model.addAttribute("category",category);
		if(category == 1) {
			BeerSearch bs = Search.getBeerSearch(cate, search);
			int listCount = aService.selectListCount(bs);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			
			ArrayList<Notice> list = aService.selectNoticeList(pi, bs);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		return "administer/noticeAdmini";
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
	
	
	//이벤트 관리
	@RequestMapping("eventAd.ad")
	public String goEvent(@RequestParam(value="currentPage", defaultValue="1")int currentPage, @RequestParam(value="status", defaultValue="A")String status, Model model, String search) {
		model.addAttribute("status",status);
		BeerSearch bs = Search.getBeerSearch(status, search);
		int listCount = aService.selectEventListCount(bs);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Event> elist= aService.selectEventList(bs, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("elist", elist);
		
		return "administer/eventAdmini";
	}
	
	@RequestMapping("eventDetailAd.ad")
	public String goEventDetail(String evNo, Model model) {
		Event e = aService.selectEventOne(evNo);
		model.addAttribute("e", e);
		return "administer/eventDetail";
	}
	@RequestMapping("updateEvent.ad")
	public String updateEvent(Model model, HttpSession session, String evNo, String content, String Astatus) {
		ArrayList<String> list = new ArrayList<String>();
		list.add(evNo);
		if(Astatus.equals("C")) {
			Batch b = BatchProcess.getBatch(list, Astatus, content);
			int result = aService.updateBatchEvent(b);
			if(result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
				return "redirect:eventAd.ad";
			}else {
				model.addAttribute("errorMsg", "실패되었습니다.");
				return "common/errorPage";
			}
		}else {
			Batch b = BatchProcess.getBatch(list, Astatus, null);
			int result = aService.updateBatchEvent(b);
			if(result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
				return "redirect:eventAd.ad";
			}else {
				model.addAttribute("errorMsg", "실패되었습니다.");
				return "common/errorPage";
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("processEvent.ad")
	public String processEvent(@RequestParam(value = "list[]") ArrayList<String> list, String Astatus, String content) {
		Batch b = BatchProcess.getBatch(list, Astatus, content);
		int result = aService.updateBatchEvent(b);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//공구 관리
	@RequestMapping("GB.ad")
	public String goGB(@RequestParam(value="currentPage", defaultValue="1")int currentPage, @RequestParam(value="category", defaultValue="1")int category, @RequestParam(value="status", defaultValue="R")String status, @RequestParam(value="status2", defaultValue="Y")String status2, Model model, String sort, String search) {
		model.addAttribute("category",category);
		model.addAttribute("sort", sort);
		if(category == 2) {
			model.addAttribute("status", status);
			BeerSearch bs = Search.getBeerSearch(status, search);
			int listCount = aService.selectGBRlistCount(bs);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<GbRequest> gblist= aService.selectGBRlist(bs, pi);
			for(GbRequest g : gblist) {
				if(g.getReqStatus().equals("R")) {
					g.setStatusName("배송준비");
				}else if(g.getReqStatus().equals("C")) {
					g.setStatusName("배송완료");
				}else if(g.getReqStatus().equals("F")) {
					g.setStatusName("배송취소");
				}else {
					g.setStatusName("배송취소완료");
				}
			}
			model.addAttribute("pi", pi);
			model.addAttribute("gblist", gblist);
		}
		if(category == 3) {
			model.addAttribute("status2", status2);
			BeerSearch bs = Search.getBeerSearch(status2, search);
			int listCount = aService.selectGBlistCount(bs);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<GroupBuy> glist= aService.selectGBlist(bs, pi);
			model.addAttribute("pi", pi);
			model.addAttribute("glist", glist);
		}
		return "administer/groupBuyAdmini";
	}
	@RequestMapping("enrollGB.ad")
	public String enrollGB(GroupBuy gb, MultipartFile upfile1,MultipartFile upfile2,MultipartFile upfile3, HttpSession session, Model model) {
		gb.setGbStart(dataFormat(gb.getGbStart()));
		gb.setGbEnd(dataFormat(gb.getGbEnd()));
		String changeName = saveFile(session, upfile1);
		Attachment a1 = filetoAttachment(gb.getPno(), upfile2, session);
		Attachment a2 = filetoAttachment(gb.getPno(), upfile3, session);
		gb.setGbThumb("resources/uploadFiles/" + changeName);
		
		int result = aService.enrollGB(gb);
		int result2 = aService.enrollAT(a1, a2);
		if(result * result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 처리되었습니다.");
			return "redirect:GB.ad";
		}else {
			model.addAttribute("errorMsg", "실패되었습니다.");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("processGB.ad")
	public String processGB(@RequestParam(value = "list[]") ArrayList<String> list, String Astatus) {
		Batch b = BatchProcess.getBatch(list, Astatus, null);
		
		
		int result = aService.updateBatchGB(b);
		int result2 = 1;
		if(Astatus.equals("D")) {
			result2 = aService.returnPoint(b);
		}
		if(result * result2 > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteG.ad")
	public String deleteG(String pNo) {
		
		int result = aService.deleteGroupBuy(pNo);
		int result2 = aService.deleteAttach(pNo);
		
		if(result * result2 > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping("goUpdateG.ad")
	public String goUpdateG(String pNo,  Model model) {
		GroupBuy g = aService.selectGBOne(pNo);
		
		g.setGbStart(dataFormatSolve(g.getGbStart()));
		g.setGbEnd(dataFormatSolve(g.getGbEnd()));
		ArrayList<Attachment> alist = aService.selectATOne(pNo);
		model.addAttribute("g", g);
		model.addAttribute("pNo", pNo);
		int i = 1;
		for(Attachment a : alist) {

			model.addAttribute("upfile" + i, a.getChangeName());
			i += 1;
		}
		return "administer/groupUpdate";
	}
	
	@RequestMapping("updateGB.ad")
	public String updateGB(GroupBuy gb, MultipartFile upfile1,MultipartFile upfile2,MultipartFile FImg, HttpSession session, Model model, String pNo) {
		int result2 = 1;
		
		gb.setGbStart(dataFormat(gb.getGbStart()));
		gb.setGbEnd(dataFormat(gb.getGbEnd()));

		Attachment a1 = filetoAttachment(gb.getPno(), upfile1, session);
		Attachment a2 = filetoAttachment(gb.getPno(), upfile2, session);

		GroupBuy gb2 = aService.selectGBOne(pNo);
		ArrayList<Attachment> alist= aService.selectATOne(pNo);
		String changeName;
		if(FImg.isEmpty()) {
			gb.setGbThumb(gb2.getGbThumb());
		}else {
			changeName = saveFile(session, FImg);
			gb.setGbThumb("resources/uploadFiles/" + changeName);
		}
		
		if(upfile1.isEmpty() && upfile2.isEmpty()) {
			System.out.println("pass");
		}else if(upfile1.isEmpty() && (!alist.isEmpty())) {
			int i = 1;
			for(Attachment a : alist) {
				if(i == 1) {
					a1 = a;
				}
				i += 1;
			}
			aService.deleteAttach(pNo);
			result2 = aService.updateAttachment(a1, a2);
		}else if(upfile1.isEmpty() && (!alist.isEmpty())) {
			int i = 1;
			for(Attachment a : alist) {
				if(i == 2) {
					a2 = a;
				}
				i += 1;
			}
			aService.deleteAttach(pNo);
			result2 = aService.updateAttachment(a1, a2);
		}
		else {
			aService.deleteAttach(pNo);
			result2 = aService.updateAttachment(a1, a2);
		}
		
		
		int result = aService.updateGB(gb);
		
		
		if(result * result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:GB.ad";
		}else {
			model.addAttribute("errorMsg", "실패되었습니다.");
			return "common/errorPage";
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
	
	public String dataFormat(String date) {
		String day = date.substring(0, date.indexOf("T"));
		String time = date.substring(date.indexOf("T") + 1, date.indexOf(":"));
		int a = Integer.parseInt(time);
		if(a == 12) {
			time = " PM " + Integer.toString(a);
		}else if(a > 12) {
			int b = a - 12;
			time = " PM " + Integer.toString(b);
		}else {
			time = " AM " + Integer.toString(a);
		}
		return day + time;
	}
	
	public String dataFormatSolve(String date) {
		String day = date.substring(0, date.indexOf("M") - 2);
		String sub = date.substring(date.indexOf("M") - 1, date.indexOf("M") + 1);
		String time = date.substring(date.indexOf("M") + 2);
		if(time.equals("12")) {
			day = day + "T" + time + ":00";
		}
		else if(sub.equals("PM")) {
			int a = Integer.parseInt(time) + 12;
			day = day + "T" + Integer.toString(a) + ":00";
		}else if(time.length() == 2) {
			day = day + "T" + time + ":00";
		}
		else {
			day = day + "T0" + time + ":00";
		}
		
		return day;
	}
	
	public Attachment filetoAttachment(int pNo, MultipartFile upfile, HttpSession session) {
		if(!upfile.getOriginalFilename().isEmpty()) {
			String savePath = session.getServletContext().getRealPath("/resources/images/");
			
			String originName = upfile.getOriginalFilename(); 
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
			String rchangeName = currentTime + ranNum + ext;
			String changeName = "resources/images/" + currentTime + ranNum + ext; // 
			
			try {
				upfile.transferTo(new File(savePath + rchangeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return new Attachment(originName, changeName, pNo);
		}else {
			return null;
		}
	}
}
