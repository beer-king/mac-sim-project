package com.beer.macSim.member.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.beer.macSim.data.model.vo.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.member.model.service.KakaoService;
import com.beer.macSim.member.model.service.MemberService;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;



@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	 @Autowired
	 private KakaoService kakaoService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("mypage.me")
	public String myPage(HttpSession session, Model model) {

		Member m = (Member)session.getAttribute("loginUser");
		
		int reviewCount = mService.reviewCount(m);
		int eventCount = mService.eventCount(m);
		int groupCount = mService.groupCount(m);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("eventCount",eventCount);
		model.addAttribute("groupCount", groupCount);
		
		return "member/myPage";
	}

	@RequestMapping("update.me")
	public String update() {
		return "member/update";
	}

	@RequestMapping("review.me")
	public String review(Model model,HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		int userNo = m.getUserNo();

		ArrayList<Score> list = mService.selectBeerReivewList(userNo);

		 model.addAttribute("list",list);


		return "member/review";
	}

	@RequestMapping("point.me")
	public String point(HttpSession session, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		
		ArrayList<PointHistory>list = mService.selectPointHistory(m);
		
		model.addAttribute("list", list);
		
		return "member/point";
	}

	@RequestMapping("event.me")
	public String event(HttpSession session, Model model,@RequestParam(value="currentPage",defaultValue="1") int currentPage) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int listCount = mService.eventCount(m);
		

		
		

		PageInfo pi =Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Event>list = mService.selectEventList(m);
		
		//System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "member/event";
	}

	@RequestMapping("group.me")
	public String group() {
		return "member/group";
	}

	@RequestMapping("beer.me")
	public String beer() {
		return "member/beer";
	}

	@RequestMapping("category.me")
	public String category() {
		return "member/category";
	}

	@RequestMapping("memberUpdate.me")
	public String memberUpdate(Member m, Model model, HttpSession session) {

		int result = mService.updateMember(m);

		if (result > 0) {

			// 세션에 담겨있던 loginUser의 Member객체 갱신된 객체로 변경해야됨!
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "회원정보변경에 성공했습니다");
			return "redirect:update.me";
		} else {
			model.addAttribute("errorMsg", "회원정보변경에 실패했습니다");
			return "common/errorPage";
		}

	}

	/*
	 * @RequestMapping("memberPwdUpdate")
	 * 
	 * public String memberPwdUpdate(String newPwd , HttpSession session,Model
	 * model){
	 * 
	 * String encPwd = bcryptPasswordEncoder.encode(newPwd);
	 * 
	 * int result = mService.memberPwdUpdate(encPwd);
	 * 
	 * if(result>0) { session.setAttribute("alertMsg", "비밀번호변경에 성공했습니다"); return
	 * "redirect:update.me"; }else { model.addAttribute("errorMsg", "비밀번호변경실패");
	 * return "common/errorPage"; }
	 * 
	 * }
	 */

	

    
    
    @RequestMapping("memberPwdUpdate")

    public String memberPwdUpdate(Member m, HttpSession session, Model model){
    	
    	
    	
        String encNewPwd = bcryptPasswordEncoder.encode(m.getNewPwd());
        String userPwd = m.getUserPwd();
        String encUserPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
        m.setNewPwd(encNewPwd);
        m.setUserPwd(encUserPwd);
    	
        
        
        if(bcryptPasswordEncoder.matches(userPwd, encUserPwd)) { // 본인이 맞을 경우
        	
        	int result = mService.memberPwdUpdate(m);
        	
        	if(result>0) { // 비밀번호 변경성공
        		session.removeAttribute("loginUser");
        		session.setAttribute("alertMsg", "비밀번호 변경 성공");
        		return "redirect:/";
        	
        	}else { // 변경실패
        		
        		model.addAttribute("errorMsg", "회원탈퇴실패ㅠㅠ");
				return "common/errorPage";
        		
        	}
        	
        }else { // 본인이 아닐경우
        	
        	model.addAttribute("errorMsg","비밀번호가 틀렸습니다");
        	return "common/errorPage";
        }
        
        
        
        	
    }
    
     
    

    @RequestMapping("memberDelete.me")
    public String memberDelete(String pwd,HttpSession session, Model model){
    	
    	// pwd : 탈퇴요청시 적은 비밀번호(평문)
		
    	Member loginUser = (Member)session.getAttribute("loginUser"); // 로그인된 회원객체
    	
    	// encPwd : 비밀번호(암호문)    	
    	String encPwd = loginUser.getUserPwd();
    	
    		if(bcryptPasswordEncoder.matches(pwd, encPwd)) { // 본인이 맞을 경우
			
				int result = mService.deleteMember(loginUser.getUserId());
				
				if(result>0) { // 탈퇴성공
					
					
					//세션에 담겨있던 loginUser 삭제
					session.removeAttribute("loginUser");
					session.setAttribute("alertMsg","회원탈퇴성공");
					return "redirect:/";
				}else { // 탈퇴 실패
					model.addAttribute("errorMsg", "회원탈퇴실패");
					return "common/errorPage";
					
				
			}
				
			}else { // 비밀번호가 틀렸을 경우
				
				model.addAttribute("errorMsg", "비밀번호가 틀렸습니다");

				return "common/errorPage";

			}


	}

	@RequestMapping("delete.ev")
	public String deleteEvent(Model model,HttpSession session,int evNo) {
		

		System.out.println(evNo);
		
		Member m  = (Member)session.getAttribute("loginUser");
		m.setEvNo(evNo);
	
		
		int result = mService.deleteEvent(m);

	
		
		if(result>0) { // 삭제 성공
			session.setAttribute("alertMsg", "이벤트가 취소되었습니다");
			return "redirect:event.me";
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "취소하는데 실패하셧습니다");
			return "common/errorPage";
		}
		
		
	}

  
	@RequestMapping("delete.gb")
	public String deleteGroupBuy(Model model,HttpSession session,int pNo){

		
		Member m = (Member) model.addAttribute("loginUser");
		m.setPNo(pNo);

		int result = mService.deleteGroupBuy(m);

		System.out.println(result);

		if(result>0){
			session.setAttribute("alertMsg","구매취소에 성공했습니다");
			return "redirect:group.me";
		}else{
			model.addAttribute("errorMsg", "구매취소에 실패했습니다");
			return "common/errorPage";
		}

	}


	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/enrollForm";
	}

	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("idFindForm.me")
	public String idFindForm() {
		return "member/idFindForm";
	}

	@RequestMapping("pwdFindForm.me")
	public String pwdFindForm() {
		return "member/pwdFindForm";
	}

	@RequestMapping("agreeForm.me")
	public String agreeForm() {
		return "member/agreeForm";
	}


    // 나의 리뷰 수정
	@RequestMapping("updateBeerReview")
	public String updateBeerReview(int newScore, String myReview,HttpSession session){

		Score score = new Score();
		score.setScore(newScore);
		score.setComments(myReview);

		Member m = (Member) session.getAttribute("loginUser");
		score.setUserNo(m.getUserNo());

		int result = mService.updateBeerReview(score);

    	return "redirect:review.me";
	}



    // 나의 리뷰 삭제
    @RequestMapping("deleteReview")
    public String deleteReview(int scoreNo , HttpSession session){

    	Score score = new Score();
    	score.setScoreNo(scoreNo);

    	Member m = (Member) session.getAttribute("loginUser");

    	score.setUserNo(m.getUserNo());

        int deleteReview = mService.deleteReview(score);

        if(deleteReview>0){
           session.setAttribute("alertMsg","리뷰삭제 성공");
           return "redirect:/";
        }else{
            session.setAttribute("alertMsg","리뷰삭제 실패");
            return "member/review";
        }

    }


  
    
    // 회원가입
    @RequestMapping("insert.me")

	public String insertMember(Member m, Model model, HttpSession session) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd()); // 평문값을 넘기면 암호화 과정을 통해서 encPwd에 담긴다.
		// System.out.println("암호화 후(암호문) :" + encPwd);
		m.setUserPwd(encPwd); // 암호문이 담겨있음! 이것을 dao까지 쭉 넘길것이다.

		int result = mService.insertMember(m);
		

		
		if (result > 0) { // 성공 => 메인페이지 url재요청

			
			Member loginUser = mService.loginMember(m); 
			
			// (포인트적립 + 내역에추가)
			PointHistory ph = new PointHistory();
			ph.setPoint(100);
			ph.setUserNo(loginUser.getUserNo());
			ph.setCategory("회원가입");
			ph.setPointHistory("적립");
			
			mService.updateMemberPoint(ph);
			

			session.setAttribute("alertMsg", "회원가입 성공! 100point 적립 되었습니다~!");
			return "redirect:/";

		} else { // 실패

			model.addAttribute("errorMsg", "회원가입 실패..");
			return "common/errorPage";
		}

	}

	@RequestMapping("findId.me")
	public String findId(Member m, Model model, HttpSession session) {

		Member findId = mService.findId(m);

		session.setAttribute("findId", findId);
		return "member/resultId";

	}

	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String userId) {

		return String.valueOf(mService.idCheck(userId));

	}


    
    
    @RequestMapping("login.me")
    public String loginMember(Member m, HttpSession session, Model model) {
    	
    	Member loginUser = mService.loginMember(m); 
    	if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
    		
    		String loginTime =  mService.loginPoint(loginUser.getUserNo());
    		
    		if(loginTime == null || Integer.parseInt(loginTime) >= 1 ) {
    			
    			/*
    			//1) memeber 포인트 +3
    				 int result = mService.memberPointUpdate(loginUser.getUserNo(), 3);
    				 //System.out.println(result); -> 1 
    				 
    			//2) 포인트 내역
    				 
    				 int result1= mService.pointHistory(loginUser.getUserNo(),3, 1, "적립");
    				 
    				 if(result*result1 > 0) {
    					 
    					 session.setAttribute("alertMsg", "출석 포인트로 3point 적립되었습니다~~!!!");
    					 
    				 }//else{
    					 
    					 //session.setAttribute("alertMsg", "이미 오늘 포인트 받아가셨어요~");
    				 //}
				*/
    				 
    			// 하나로 퉁치기 (포인트적립 + 내역에추가)
					PointHistory ph = new PointHistory();
					ph.setPoint(3);
					ph.setUserNo(loginUser.getUserNo());
					ph.setCategory("로그인");
					ph.setPointHistory("적립");
					
					int result = mService.updateMemberPoint(ph);
					
					// 로그인 시간 update
					int result2 = mService.updateMemberLoginTime(loginUser.getUserNo());
					
					if(result*result2 > 0) {
   					 session.setAttribute("alertMsg", "출석 포인트로 3point 적립되었습니다~~!!!");
   				    }
					
    		}else {
    			session.setAttribute("alertMsg", "이미 오늘 포인트 받아가셨어요~");
    		}
    		
    		// 확인해보기
    		//System.out.println(loginTime);
    		
    		
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:/";

		} else {

			model.addAttribute("errorMsg", "로그인 실패..");
			return "common/errorPage";

		}
	}

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
		session.invalidate();
		return "redirect:/";

	}

	
	
	
	/* @RequestMapping("kakaologin.do")
	    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
	        System.out.println("#########" + code);
	        return "member/loginForm";
	   }*/
	 // 카카오
	 @RequestMapping(value="/kakaologin.do")
	 public String login(@RequestParam("code") String code, HttpSession session) {
	     String access_Token = kakaoService.getAccessToken(code);
	     HashMap<String, Object> userInfo =  kakaoService.getUserInfo(access_Token);
	     System.out.println("login Controller : " + userInfo);
	     
	     //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	     if (userInfo.get("email") != null) {
	         session.setAttribute("userId", userInfo.get("email"));
	         session.setAttribute("access_Token", access_Token);
	     }
	     
	     return "redirect:/";
	 }

	 @RequestMapping(value="/logout.do")
	 public String logout(HttpSession session) {
		 kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
	     session.removeAttribute("access_Token");
	     session.removeAttribute("userId");
	     return "redirect:/";
	 }
	 
	 

	 // 비번찾기(메일발송)
	 @RequestMapping("findPwd.me")
	 public String findPwd(Member m,String userId, String email,String div, Model model, HttpSession session, HttpServletRequest request) {
		 
		 Member member = mService.loginMember(m);
		 
		 //System.out.println(member);
		 if(member == null) {
			 model.addAttribute("historyBack", true);
			 session.setAttribute("alertMsg", "해당 회원이 존재하지 않습니다.");
			 return "redirect:/";
		 }
		 
		 if(member.getEmail().equals(email)==false) {
			 model.addAttribute("historyBack", true);
			 session.setAttribute("alertMsg", "이메일이 올바르지 않습니다.");
			 return "redirect:/";
		 }else {
			 
			mService.sendMail(userId, email);
			return "member/newPwd";
		 }
		 
		 
		 
		 
		 
		 /*else {
			 
			    String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "이메일 입력";
				String hostSMTPpwd = "비밀번호 입력";

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "이메일 입력";
				String fromName = "Spring Homepage";
				String subject = "";
				String msg = "";
				
				if(div.equals("find_pw")) {
					subject = "Spring Homepage 임시 비밀번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += member.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
					msg += "<p>임시 비밀번호 : ";
					msg += member.getUserPwd() + "</p></div>";
				}
				// 받는 사람 E-Mail 주소
				String mail = member.getEmail();
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
			}
			 
			 
			 
		 }
		 
		 Member loginMember = (Member)session.getAttribute("loginMember");
		 /*
		 String contextPath = request.getContextPath();
		 mService.sendTempLoginPwToEmail(loginMember, contextPath);
		 */
		 
		 
		 
		 
	
		 
		 
		 
	 }
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
