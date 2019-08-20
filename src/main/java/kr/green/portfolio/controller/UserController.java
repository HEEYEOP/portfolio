package kr.green.portfolio.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
		logger.info("e-mail중복검사 중");
		boolean repetitionCheck = userService.repetitionCheck(userEmail);
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
	
	
	
	
	
	
	
	
	
	
	
}
