package com.beer.macSim.member.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beer.macSim.member.model.vo.Member;

public class MailController {

	@Autowired
    JavaMailSender mailSender; //root-context에서 생성한 google mailsender 빈
    
    // mailSending 코드
      @RequestMapping(value = "/sendpass")
      public String mailSending(Model model,HttpServletResponse response) {
        Map<String, Object> map = model.asMap();
        Member m = (Member)map.get("resultDto");
        
        System.out.println(m.getEmail());
        System.out.println(m.getUserId());
        String setfrom = "macsimmacsim44@gmail.com";         
        String tomail  = m.getEmail();     // 받는 사람 이메일
        String title   = m.getUserName() + "님의 아이디와 비밀번호 입니다.";      // 제목
        String content = m.getUserName() + "님의 아이디는 " 
                            + m.getUserId()
                            + " 비밀번호는 "
                            + m.getUserPwd()
                            + " 입니다.";    // 내용
       
        try {
          MimeMessage message = mailSender.createMimeMessage();
          MimeMessageHelper messageHelper  = new MimeMessageHelper(message, true, "UTF-8"); //두번째 인자 true여야 파일첨부 가능.
     
          messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
          messageHelper.setTo(tomail);     // 받는사람 이메일
          messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
          messageHelper.setText(content);  // 메일 내용
         
          mailSender.send(message);
          
          response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>alert('성공적으로 메일을 발송했습니다.');history.go(-1);</script>");
          out.flush();
 
 
        } catch(Exception e){
          System.out.println(e);
        }
       
        return "login";
      }


}
