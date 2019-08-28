package kr.green.portfolio.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/board/write")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception{
		logger.info("설문 타입 설정 페이지 실행");
	    mv.setViewName("/board/write");
	    return mv;
	}
	
	@RequestMapping(value="/board/writing")
	public ModelAndView boardWriting(ModelAndView mv, String boardType) throws Exception{
		logger.info("설문 작성 페이지 실행");
	
		mv.addObject("boardType", boardType);
	    mv.setViewName("/board/writing");
	    return mv;
	}

}
