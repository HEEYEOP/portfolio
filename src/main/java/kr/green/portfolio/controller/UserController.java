package kr.green.portfolio.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.service.UserService;
import kr.green.portfolio.utils.UploadFileUtils;
import kr.green.portfolio.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@Resource
	private String uploadPath;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value="/main/signup", method=RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) throws Exception{
		logger.info("회원가입페이지 실행");

	    mv.setViewName("/main/signup");
	    return mv;
	}
	
	@RequestMapping(value ="/dup") //Ajax중복검사 메소드
	@ResponseBody
	public Map<String,String> emailcheck(@RequestBody String userEmail){
		logger.info("e-mail중복검사 및 이메일 인증번호 발송");
		boolean repetitionCheck = userService.repetitionCheck(userEmail);
		String sendingNum = ""; 
		if(repetitionCheck == false) { //중복이 false, 즉 중복되지 않았다면, 기존 회원이 아니라면

		    String recipient  = userEmail;     // 받는 사람 이메일
		    String title = "이메일 인증번호 입니다";
		    sendingNum = userService.createPw();
			String contents = ("이메일 인증 번호는  " + sendingNum + " 입니다");
		   
		    userService.sendMail(recipient, title, contents);
		    
		}
		Map map = new HashMap<String, String>();
		map.put("sending", sendingNum);
		return map;	//중복이 되었다면 빈문자열을 넘길테고, 중복되지 않았다면 인증번호를 보냄
	}
	
	
	@RequestMapping(value="/main/signup", method=RequestMethod.POST)
	public String signupPost(UserVO uVO, String userBirth2, MultipartFile confirmFile2) throws Exception{
		uVO.setUserBirth(userBirth2);
		
		String confirmFile = UploadFileUtils.uploadFile(uploadPath, confirmFile2.getOriginalFilename(),confirmFile2.getBytes());
		uVO.setConfirmFile(confirmFile);
		
		System.out.println("등록할 회원정보" + uVO);
		userService.enrollUser(uVO);
		
	    return "redirect:/main/login";
	}
	
	
	@RequestMapping(value="/main/login", method=RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) throws Exception{
		
	    mv.setViewName("/main/login");
	    return mv;
	}
	
	@RequestMapping(value="/main/login", method=RequestMethod.POST)
	public String loginPost(UserVO uVO, Model model){
		System.out.println("로그인시도한 정보"+uVO);
		UserVO loginedUser = userService.login(uVO);
		if(loginedUser != null) {
			System.out.println("로그인성공");
			model.addAttribute("user", loginedUser);
			return "redirect:/main/home";
		}else {
			System.out.println("로그인실패");
			return "redirect:/main/login";
		}
	}
	
	//로그아웃기능
	@RequestMapping(value="/logout", method = RequestMethod.GET) //이게 POST면 에러 나던데 이유는 무엇일까?
	public String logoutPost(HttpServletRequest r) throws Exception {
		r.getSession().removeAttribute("user");
		return "redirect:/main/home";
	}
  

	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		logger.info("임시 비밀번호 발송");
		
		String userType = request.getParameter("userType");
		System.out.println("선택한 userType값 =" + userType);
	    String userEmail  = request.getParameter("userEmail");     // 받는 사람 이메일
	    System.out.println("작성한 userEmail값 = "+userEmail);
	    
	    boolean matchRes = userService.matchEmailandType(userType,userEmail);
	    System.out.println("존재하는 작성자인가?"+ matchRes);
	    
	   if(matchRes) {
		   String title = "임시비밀번호 입니다";
		   String tmpPw = userService.createPw();
		   System.out.println("임시비밀번호 : "+ tmpPw);
		   String contents = ("임시 비밀번호는 " + tmpPw + "입니다");
		   userService.sendMail(userEmail, title, contents);
		  
		   System.out.println("성공!! 임시비밀번호 발송에 성공하였습니다.");
		   return "redirect:/main/login";
		  	
	      }else {
	    	  System.out.println("실패!! 임시비밀번호 발송에 실패하였습니다.");
	    	  return "redirect:/main/home";
	      }
	   
	 }
	
	//아이디 찾기(ajax를 통해서)
	@RequestMapping(value ="/idSearch")
	@ResponseBody
	public Map<String, String> idSearch(@RequestBody String str){
		/* System.out.println("아이디 찾을때, 넘겨받은 정보 : "+str); */
		String userEmail = userService.matchPhoneandName(str);
		System.out.println(userEmail);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userEmail", userEmail);
		
	    return map;
	}
	
	
	
	

	
}
