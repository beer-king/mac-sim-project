package com.beer.macSim.member.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;


import com.beer.macSim.member.model.service.MemberService;
import com.beer.macSim.member.model.vo.Member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beer.macSim.member.model.service.KakaoService;



@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	 @Autowired
	 private KakaoService kakaoService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("mypage.me")
	public String myPage() {
		return "member/myPage";
	}

	@RequestMapping("update.me")
	public String update() {
		return "member/update";
	}

	@RequestMapping("review.me")
	public String review(Model model) {

		// ArrayList<> list = mService.selectBeerReivewList();

		// model.addAttribute("list",list);


		return "member/review";
	}

	@RequestMapping("point.me")
	public String point() {
		return "member/point";
	}

	@RequestMapping("event.me")
	public String event() {
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
					
					System.out.println(result);
					
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

	

/*
    @RequestMapping("deleteReview")
    public String deleteReview(int scoreNo , HttpSession session){
        int deleteReview = mService.deleteReview(scoreNo);

        if(deleteReview>0){
           session.setAttribute("alertMsg","리뷰삭제 성공");
           return "redirect:/";
        }else{
            session.setAttribute("alertMsg","리뷰삭제 실패");
            return "member/review";
        }

    }
    */

  
    
    // 회원가입
    @RequestMapping("insert.me")

	public String insertMember(Member m, Model model, HttpSession session) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd()); // 평문값을 넘기면 암호화 과정을 통해서 encPwd에 담긴다.
		// System.out.println("암호화 후(암호문) :" + encPwd);
		m.setUserPwd(encPwd); // 암호문이 담겨있음! 이것을 dao까지 쭉 넘길것이다.

		int result = mService.insertMember(m);

		if (result > 0) { // 성공 => 메인페이지 url재요청

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

			session.setAttribute("loginUser", loginUser);
			return "redirect:/";

		} else {

			model.addAttribute("errorMsg", "로그인 실패..");
			return "common/errorPage";

		}
	}

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";

	}

	
	
	
	/* @RequestMapping("kakaologin.do")
	    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
	        System.out.println("#########" + code);
	        return "member/loginForm";
	   }*/

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

	 @RequestMapping(value="/kakaologout.do")
	 public String logout(HttpSession session) {
		 kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
	     session.removeAttribute("access_Token");
	     session.removeAttribute("userId");
	     return "redirect:/";
	 }


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
