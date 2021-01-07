package com.beer.macSim.event.controller;


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
import com.beer.macSim.common.template.Search;
import com.beer.macSim.event.model.service.EventService;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.EvReply;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.event.model.vo.EventAttendee;
import com.beer.macSim.event.model.vo.EventSearch;
import com.beer.macSim.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class EventController {
	
	@Autowired
	private EventService evService;
	
	@RequestMapping("list.ev") // list.ev?currentPage=xx
	public String selectEventList(@RequestParam(value="currentPage", defaultValue="1")int currentPage,
								  Model model) {
		
		int listCount = evService.selectEventCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Event> list = evService.selectEventList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "event/eventListView";
	}
	
	@RequestMapping("detail.ev")
	public String selectEvent(@RequestParam(defaultValue="0")int userNo, int eno, Model model) {
		System.out.println(userNo);
		
		int result1 = evService.increaseCount(eno);
		
		if(result1 > 0) {
			Event ev = evService.selectEvent(eno);
			ArrayList<Attachment> atList = evService.selectEvAttachment(eno);
			
			EventAttendee ea = new EventAttendee();
			ea.setEvNo(eno);
			ea.setUserNo(userNo);
			
			int chApp = 0;
			chApp = evService.checkApplyEvent(ea);
			
			model.addAttribute("chApp", chApp);
			model.addAttribute("ev", ev);
			model.addAttribute("atList", atList);
			return "event/eventDetailView";
		}else {
			model.addAttribute("errorMsg", "존재하지 않는 게시글입니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("enrollForm.ev")
	public String enrollForm() {
		return "event/eventEnrollForm";
	}
	
	@RequestMapping("insert.ev")
	public String insertEvent(Event e, Attachment a,
							  @RequestParam("evDate") String evDate, @RequestParam("evTime") String evTime,
							  @RequestParam("appDate") String appDate, @RequestParam("appTime") String appTime,	
							  @RequestParam("upfile1") MultipartFile upfile1, @RequestParam("upfile2") MultipartFile upfile2,
							  HttpSession session,  Model model) {
		// 첨부파일 업로드 기능을 하기 위해서는 라이브러리 2개 추가(pom.xml파일에), 빈으로 등록(root-context.xml파일에)해야 됨
		
		if(!upfile1.getOriginalFilename().equals("") || !upfile2.getOriginalFilename().equals("")) {
			
			String changeName1 = saveFile(session, upfile1);
			String changeName2 = saveFile(session, upfile2);
			
			e.setEvThumb("resources/uploadFiles/" + changeName1);
			a.setOriginName(upfile2.getOriginalFilename());
			a.setChangeName("resources/uploadFiles/" + changeName2);
		}
		e.setEvStartTime(evDate + " " + evTime);
		e.setReqTime(appDate + " " + appTime);
		
		int result = evService.insertEvent(e, a);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 이벤트글이 등록되었습니다.");
			return "redirect:list.ev";
		}else { // 실패
			model.addAttribute("errorMsg", "이벤트 작성 실패");
			return "common/errorPage";
		}
	}
	
	
	// 첨부파일 업로드 시켜주는 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		// 파일을 업로드시킬 물리적인 경로(savePath)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 어떤 이름으로 업로드시킬건지의 수정명(changeName)
		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*900000 + 100000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	@RequestMapping("apply.ev")
	public String applyEvent(EventAttendee ea,
					         HttpSession session, Model model) {
		
		int result1 = 0;
		result1 = evService.increaseApplyNo(ea);
		
		if(result1 > 0 ) {
			int result2 = 0;
			result2 = evService.decreasePoint(ea);
			
			if(result2 > 0 ){
				
				int result3 = 0;
				result3 = evService.applyEvent(ea);
				
				if(result3 > 0) {
					
					session.setAttribute("alertMsg", "성공적으로 이벤트가 신청되었습니다.");
					return "redirect:event.me";
				}else {
					session.setAttribute("alertMsg", "이벤트 신청이 실패하였습니다.");
					return "redirect:list.ev";
				}
				
			}else{
				session.setAttribute("alertMsg", "이벤트 신청할 포인트가 부족합니다.");
				return "redirect:point.me";
			}
				
		}else{
			session.setAttribute("alertMsg", "해당 이벤트 참여가 마감되었습니다.");
			return "redirect:list.ev";
		}
	}
	
	@RequestMapping("search.ev")
	public String searchEventList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
							      String category, String searchWord, Model model) {

		EventSearch es = Search.getEventSearch(category, searchWord);
		int searchCount = evService.searchEventCount(es);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 5);
		ArrayList<Event> list = evService.searchEventList(pi, es);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("es", es);
		
		return "event/eventListView";
	}
	
	// 댓글리스트 조회용
	@ResponseBody
	@RequestMapping(value="rlist.ev", produces="application/json; charset=utf-8")
	public String selectEvReplyList(int eno) {
		
		ArrayList<EvReply> list = evService.selectEvReplyList(eno);
		
		return new Gson().toJson(list);
	}
	
	// 댓글 작성용
	@ResponseBody
	@RequestMapping("rinsert.ev")
	public String insertEvReply(EvReply er) {
		
		int result = evService.insertEvReply(er);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
