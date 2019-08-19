package kr.green.portfolio.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.dao.UserDAO;
import kr.green.portfolio.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	@Autowired
	UserDAO userDao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@RequestMapping(value="/main/home")
	public ModelAndView openTilesView(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/home");
	    return mv;
	}
	
	@RequestMapping(value="/main/signup", method=RequestMethod.GET)
	public ModelAndView openTilesView2(ModelAndView mv,UserVO uVO, String user_email) throws Exception{
		System.out.println(uVO);
		
	    mv.setViewName("/main/signup");
	    return mv;
	}
	@RequestMapping(value="/main/signup", method=RequestMethod.POST)
	public ModelAndView openTilesView3(ModelAndView mv, String user_birth2, UserVO uVO) throws Exception{
		uVO.setUser_birth(user_birth2);
		System.out.println(uVO);
		
	    mv.setViewName("/main/signup");
	    return mv;
	}
	
	
	@RequestMapping(value="/main/login", method=RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) throws Exception{
		
	    mv.setViewName("/main/login");
	    return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
