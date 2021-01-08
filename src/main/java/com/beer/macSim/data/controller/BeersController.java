
/*
package com.beer.macSim.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.data.model.service.BeerService;
import com.beer.macSim.data.model.vo.Beers;

@Controller
public class BeersController {
	
	@Autowired
	private BeerService bService;
		
	@RequestMapping("beers.db")
	public String selectBeersList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		int listCount= bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Beers> list = bService.selectBeersList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "beer/beers";
	}
	
	@RequestMapping("beerDetail.db")
	public String selectDetailView(int  bno, Model model) {
		int result = bService.increaseCount(bno);
		if(result >0) {
			
			Beers  b = bService.selectBeerDetail(bno);
			model.addAttribute("b",b);
			return "beer/beerDetail";
			
		}else {//실패 
			model.addAttribute("errorMsg","게시글 작성이 안되었습니다.");
			return "common/errorPage";
		}
	}
	
	//이미지 업로드/path
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/images/beers");
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		//파일경로 + 파일수정명으로 파일을 생성해서 업로드 시키기 
		//1.파일생성 
		try {
			upfile.transferTo(new File(savePath + changeName)); 
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName; //반환(return)시켜서 다른 메소드에서 불러올 수 있게 처리 
	}
	

}


 */