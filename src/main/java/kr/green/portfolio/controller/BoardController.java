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
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.surveyTypeVO;
import kr.green.portfolio.vo.vsTypeVO;

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
		
		
		ArrayList<FieldVO> fieldList = boardService.getFieldList();
		mv.addObject("field", fieldList);
		
		mv.addObject("boardType", boardType);
	    mv.setViewName("/board/writing");
	    return mv;
	}
	
	@RequestMapping(value="/board/writing", method = RequestMethod.POST)
	public String boardWritingPost(BoardVO bVO, String[] vsContents, MultipartFile[] fileTitle, MultipartFile mainFile) throws IOException, Exception {
		logger.info("작성한 게시물 넘기는 중");
		
		/* System.out.println("내가 작성한 게시물 : " + bVO); */
		int boardNum = boardService.addBoard(bVO);
		
		if(vsContents != null) {
			boardService.addVsType(boardNum ,vsContents);
		}
		
		
		
		
		//파일업로드 기능 -----------------이거 서비스로 뺐으면 좋겠는데, 나중에생각해보기 
		if(boardNum != -1) {
			
			//첨부파일(다중파일) 업로드
			for(MultipartFile tmp : fileTitle) {
				if(tmp.getOriginalFilename().length() != 0) {
					String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(), tmp.getBytes());
					FileVO files = new FileVO();
					files.setFileBoardNum(boardNum);
					files.setFileTitle(file);
					files.setIsMainImg("N");
					boardService.addFile(files);
				}
			}
			
			//게시물메인이미지 첨부파일 업로드
			String mainImg = UploadFileUtils.uploadFile(uploadPath, mainFile.getOriginalFilename(), mainFile.getBytes());
			FileVO file = new FileVO();
			file.setFileBoardNum(boardNum);
			file.setFileTitle(mainImg);
			file.setIsMainImg("Y"); //이건 메인이지 일때만 해주는거
			boardService.addFile(file);
		}
		/* System.out.println("내가 방금전에 등록한 게시물의 번호는  "+boardNum); */
		
		 return "redirect:/main/home";
	}
	
	@RequestMapping(value="/board/fieldBoard")
	public ModelAndView fieldBoard(ModelAndView mv) throws Exception{
		logger.info("주제별 설문 페이지 실행");
	    mv.setViewName("/board/fieldBoard");
	    return mv;
	}
	
	//게시물 전체보기 페이지
	@RequestMapping(value="/board/totalBoard", method = RequestMethod.GET )
	public ModelAndView totalBoard(ModelAndView mv) throws Exception{
		logger.info("설문 전체 보기 페이지 실행");
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		//System.out.println(boardList);
		mv.addObject("boardList", boardList);
		
		
		
	    mv.setViewName("/board/totalBoard");
	    return mv;
	}
	
	//게시물 상세보기 페이지
	@RequestMapping(value="/board/view", method = RequestMethod.GET)
	public ModelAndView viewGet(ModelAndView mv, int boardNum) throws Exception{
		logger.info("게시물 상세보기 페이지 실행");
		boardService.updateViewsCount(boardNum);
		
		BoardVO getBoard = boardService.getBoard(boardNum);
		String subType = getBoard.getBoardSubtype();

		if(subType.equals("VS")) { //서브타입이 VS일때 ----->여기 밑에다가 if문으로(내가 이 서브타입에 참여한 경험이 있는지를 체크해서 있다면, 어떤신호를 함께 넘겨서 jsp를 다르게 구성, 또 밑에 yes객체 no객체를 밖에서 선언해서 저걸 가져다 쓸 수 있게 만들자)
			ArrayList<vsTypeVO> vs = boardService.getSubVS(getBoard.getBoardNum());
			for(vsTypeVO tmp : vs) {
				if(tmp.getyORn().equals("Y")) {
					vsTypeVO yes = tmp;
					mv.addObject("yes", yes);
				}else {
					vsTypeVO no = tmp;
					mv.addObject("no", no);
				}
			}
			
		}else if(subType.equals("SURVEY")) { //서브타입이 SURVEY일때
			//surveyTypeVO sub = boardService.getSubSURVEY(getBoard.getBoardNum());
		}
		
	
		mv.addObject("board", getBoard);
		mv.setViewName("/board/view");
		return mv;
	}
	
	
	@RequestMapping(value="/board/view", method = RequestMethod.POST)
	public String viewPost(ParticipationVO pVO) {
		logger.info("설문결과 DB에 저장하는 중");
		//System.out.println(pVO);
		boardService.addSubRes(pVO);
		
		
		return "redirect:/main/home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
