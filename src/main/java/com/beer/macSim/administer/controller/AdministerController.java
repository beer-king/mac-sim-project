package com.beer.macSim.administer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.beer.macSim.administer.model.service.AdminService;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;


@Controller
public class AdministerController {
	@Autowired
	private AdminService aService;
	
	
	@RequestMapping("callAd.ad")
	public String goCall() {
		return "administer/callAdmini";
	}
	@RequestMapping("beerAd.ad")
	public String goBeer(int category, Model model) {
		model.addAttribute("category",category);
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
