package kr.green.portfolio.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.dao.UserDAO;
import kr.green.portfolio.service.UserService;
import kr.green.portfolio.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	@Autowired
	UserDAO userDao;
	@Autowired
	UserService userService;
	
	
	
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
	@RequestMapping(value="/main/signup", method=RequestMethod.POST)
	public String signupPost(ModelAndView mv,UserVO uVO, String user_birth2) throws Exception{
		uVO.setUser_birth(user_birth2);
		System.out.println(uVO);
		
	    return "redirect:/main/signup";
	}
	
	
	@RequestMapping(value ="/dup")
	@ResponseBody
	public boolean emailcheck(@RequestBody String user_email){
		logger.info("e-mail중복검사 중");
		boolean repetitionCheck = userService.repetitionCheck(user_email);
		return repetitionCheck;	
	}
	
	
	@RequestMapping(value="/main/login", method=RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) throws Exception{
		
	    mv.setViewName("/main/login");
	    return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
