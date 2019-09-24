package kr.green.portfolio.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.service.BoardService;
import kr.green.portfolio.service.UserService;
import kr.green.portfolio.vo.BoardVO;

@Controller
public class PageController {
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	

	//메인페이지 실행
	@RequestMapping(value="/main/home")
	public ModelAndView main(ModelAndView mv) throws Exception{
		logger.info("메인페이지 실행");
		
		ArrayList<BoardVO> surveyList = boardService.getSurveyList();
		//System.out.println("서베이리스트 찍어본다"+surveyList);
		mv.addObject("surveyList", surveyList);
		
		
	    mv.setViewName("/main/home");
	    return mv;
	}
	
	
	
	
	
	
	@RequestMapping(value="/main/pageIntro")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception{
		logger.info("설문 타입 설정 페이지 실행");
	    mv.setViewName("/main/pageIntro");
	    return mv;
	}

	
	

}
