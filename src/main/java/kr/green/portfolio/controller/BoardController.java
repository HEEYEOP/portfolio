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
import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/board/write")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception{
		logger.info("설문 타입 설정 페이지 실행");
	    mv.setViewName("/board/write");
	    return mv;
	}
	
	@RequestMapping(value="/board/writing", method = RequestMethod.GET)
	public ModelAndView boardWriting(ModelAndView mv, String boardType) throws Exception{
		logger.info("설문 작성 페이지 실행");
		
		/* 여기에 필드 셀렉 박스 추가하기 위한 일을 시킬꺼야 */
		ArrayList<FieldVO> fieldList = boardService.getFieldList();
		mv.addObject("field", fieldList);
		mv.addObject("boardType", boardType);
	    mv.setViewName("/board/writing");
	    return mv;
	}
	
	@RequestMapping(value="/board/writing", method = RequestMethod.POST)
	public String boardWritingPost(BoardVO bVO, MultipartFile fileTitle) {
		logger.info("작성한 게시물 넘기는 중");
		
		 System.out.println("내가 작성한 게시물 : "+ bVO);
		 System.out.println("파일넘어오는거 확인해보게쒀 : " + fileTitle);
		
		 return "redirect:/main/home";
	}
	
	@RequestMapping(value="/board/fieldBoard")
	public ModelAndView fieldBoard(ModelAndView mv) throws Exception{
		logger.info("주제별 설문 페이지 실행");
	    mv.setViewName("/board/fieldBoard");
	    return mv;
	}
	
	//게시물 전체보기 페이지
	@RequestMapping(value="/board/totalBoard")
	public ModelAndView totalBoard(ModelAndView mv) throws Exception{
		logger.info("설문 전체 보기 페이지 실행");
	    mv.setViewName("/board/totalBoard");
	    return mv;
	}
	
	

}
