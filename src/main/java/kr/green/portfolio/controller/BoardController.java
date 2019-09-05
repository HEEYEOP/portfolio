package kr.green.portfolio.controller;

import java.io.IOException;
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
import kr.green.portfolio.utils.UploadFileUtils;
import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	private String uploadPath;
	
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
	public String boardWritingPost(BoardVO bVO, MultipartFile[] fileTitle, MultipartFile mainFile) throws IOException, Exception {
		logger.info("작성한 게시물 넘기는 중");
		
		 System.out.println("내가 작성한 게시물 : " + bVO);
		int boardNum = boardService.addBoard(bVO);
		
		if(boardNum != -1) {
			String mainImg = UploadFileUtils.uploadFile(uploadPath, mainFile.getOriginalFilename(), mainFile.getBytes());
			System.out.println(mainImg);
			
			FileVO file = new FileVO();
			file.setFileBoardNum(boardNum);
			file.setFileTitle(mainImg);
			file.setIsMainImg("Y"); //이건 메인이지 일때만 해주는거
			boardService.addFile(file);
		}
		System.out.println("내가 방금전에 등록한 게시물의 번호는  "+boardNum);
		
		
		 
		 
//		 얘가 잘 들어오는건지는 일단 나중에 확인해볼께
//		 System.out.println("다중0파일넘어오는거 확인해보게쒀 : " + fileTitle);
//		 System.out.println("메인파일 넘어오는거 확인하게쒀 : " + mainFile);
//		
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
