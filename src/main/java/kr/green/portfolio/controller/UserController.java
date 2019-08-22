package kr.green.portfolio.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.dao.UserDAO;
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
	@RequestMapping(value="/main/home")
	public ModelAndView main(ModelAndView mv) throws Exception{
		logger.info("메인페이지 실행");
	    mv.setViewName("/main/home");
	    return mv;
	}
	
	@RequestMapping(value="/main/signup", method=RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) throws Exception{
		logger.info("회원가입페이지 실행");

	    mv.setViewName("/main/signup");
	    return mv;
	}
	
	@RequestMapping(value ="/dup") //Ajax중복검사 메소드
	@ResponseBody
	public boolean emailcheck(@RequestBody String userEmail){
		logger.info("e-mail중복검사 및 이메일 인증번호 발송");
		boolean repetitionCheck = userService.repetitionCheck(userEmail);
		
		if(repetitionCheck == false) {
			String setfrom = "jyihyo1321@gmail.com";      
			String title = "이메일 인증번호 입니다";
		    String recipient  = userEmail;     // 받는 사람 이메일
		    System.out.println("인증번호를 받을 이메일 주소 = "+recipient);
		    
		    try { 
				MimeMessage message = mailSender.createMimeMessage(); 
			  	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			  
			  	messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			  	messageHelper.setTo(recipient); // 받는사람 이메일 
			  	messageHelper.setSubject(title);// 메일제목은 생략이 가능하다 
			  	messageHelper.setText("이메일인증번호 xxx 입니다."); // 메일 내용
		
			  	mailSender.send(message); 
			}catch(Exception e){ System.out.println(e); }
		    
		}
		return repetitionCheck;	
	}
	
	
	@RequestMapping(value="/main/signup", method=RequestMethod.POST)
	public String signupPost(ModelAndView mv,UserVO uVO, String userBirth2, MultipartFile confirmFile2) throws Exception{
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
	public String loginPost(UserVO uVO){
		System.out.println("로그인시도한 정보"+uVO);
		boolean loginOK = userService.login(uVO);
		if(loginOK) {
			System.out.println("로그인성공");
			return "redirect:/main/home";
		}else {
			System.out.println("로그인실패");
			return "redirect:/main/login";
		}
	}
	
  

	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		logger.info("임시 비밀번호 발송");
		
		String setfrom = "yjihyo1321@gmail.com";      
		String title = "임시비밀번호 입니다";
		String userType = request.getParameter("userType");
		System.out.println("선택한 userType값 =" + userType);
	    String userEmail  = request.getParameter("userEmail");     // 받는 사람 이메일
	    System.out.println("작성한 userEmail값 = "+userEmail);
	    
	    boolean matchRes = userService.matchEmailandType(userType,userEmail);
	    System.out.println("존재하는 작성자인가?"+ matchRes);
	    
	   if(matchRes) {
		  try { 
			MimeMessage message = mailSender.createMimeMessage(); 
		  	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		  
		  	messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
		  	messageHelper.setTo(userEmail); // 받는사람 이메일 
		  	messageHelper.setSubject(title);// 메일제목은 생략이 가능하다 
		  	messageHelper.setText("임시E-mail발송입니다."); // 메일 내용
		  
		  	mailSender.send(message); 
		  	}catch(Exception e){ System.out.println(e); }
		  
		  	System.out.println("성공!! 임시비밀번호 발송에 성공하였습니다.");
		  	return "redirect:/main/login";
		  	
	      }else {
	    	  System.out.println("실패!! 임시비밀번호 발송에 실패하였습니다.");
	    	  return "redirect:/main/home";
	      }
	   
	 }
	

	
}
