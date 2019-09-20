package kr.green.portfolio.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.portfolio.service.BoardService;
import kr.green.portfolio.utils.UploadFileUtils;
import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.CommentVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.LikeVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.UserVO;
import kr.green.portfolio.vo.surveyTypeVO;
import kr.green.portfolio.vo.vsTypeVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/board/write")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception {
		logger.info("설문 타입 설정 페이지 실행");
		mv.setViewName("/board/write");
		return mv;
	}

	@RequestMapping(value = "/board/writing", method = RequestMethod.GET)
	public ModelAndView boardWriting(ModelAndView mv, String boardType) throws Exception {
		logger.info("설문 작성 페이지 실행");

		ArrayList<FieldVO> fieldList = boardService.getFieldList();
		mv.addObject("field", fieldList);

		mv.addObject("boardType", boardType);
		mv.setViewName("/board/writing");
		return mv;
	}
	//------------------------------------위에꺼 멀쩡함--------------------------
	
	
	
	
	

	@RequestMapping(value = "/board/writing", method = RequestMethod.POST)
	public String boardWritingPost(BoardVO bVO, String[] vsContents, MultipartFile[] fileTitle, MultipartFile mainFile,
									 String QcntArray, String[] questionType, String[] isEssential, String[] surveyContents, int[] maxSelectNum) throws IOException, Exception {
		logger.info("작성한 게시물 넘기는 중");
		
		
		/* System.out.println("내가 작성한 게시물 : " + bVO); */
		
		int boardNum = boardService.addBoard(bVO);	//게시물 넣을때, 게시물타입에 따라서 deadline을 넣을지 말지 따로 나눠서 생각해줘야함, service에서 타입 나눠서 일 처리하기 
		
		if(vsContents != null) {
			boardService.addVsType(boardNum ,vsContents);
		}
		if(QcntArray != "") {
			
			//여기 컨트롤러에서는 간단하게 add서비스만 시키고, 매개변수로 넘어온값들을 다 서비스로 넘겨서 서비스에서 기능을 구현하려고 함
			boardService.addSurveyType(boardNum,QcntArray,questionType,isEssential,surveyContents,maxSelectNum);
			
		}
		
		
		//파일업로드 기능 -----------------이거 서비스로 뺐으면 좋겠는데, 나중에생각해보기 
		if(boardNum != -1) {
			if(fileTitle != null) {
				
				
				
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
				
			}
			
			if(mainFile != null) {
					
				
				//게시물메인이미지 첨부파일 업로드
				String mainImg = UploadFileUtils.uploadFile(uploadPath, mainFile.getOriginalFilename(), mainFile.getBytes());
				FileVO file = new FileVO();
				file.setFileBoardNum(boardNum);
				file.setFileTitle(mainImg);
				file.setIsMainImg("Y"); //이건 메인이지 일때만 해주는거
				boardService.addFile(file);
			}
		}
		/* System.out.println("내가 방금전에 등록한 게시물의 번호는  "+boardNum); */

		return "redirect:/main/home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//밑에꺼 멀쩡함-----------------------------------------------------
	
	
	
	

	@RequestMapping(value = "/board/fieldBoard")
	public ModelAndView fieldBoard(ModelAndView mv) throws Exception {
		logger.info("주제별 설문 페이지 실행");
		mv.setViewName("/board/fieldBoard");
		return mv;
	}

	// 게시물 전체보기 페이지
	@RequestMapping(value = "/board/totalBoard", method = RequestMethod.GET)
	public ModelAndView totalBoard(ModelAndView mv) throws Exception {
		logger.info("설문 전체 보기 페이지 실행");
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		// System.out.println(boardList);
		mv.addObject("boardList", boardList);

		mv.setViewName("/board/totalBoard");
		return mv;
	}

	
	
	
	// 게시물 상세보기 페이지----------------------------------------------------------------------
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public ModelAndView viewGet(ModelAndView mv, int boardNum, HttpServletRequest r) throws Exception {
		logger.info("게시물 상세보기 페이지 실행");
		boardService.updateViewsCount(boardNum); // 게시물 조회수 증가

		BoardVO getBoard = boardService.getBoard(boardNum);

		UserVO uVO = (UserVO) r.getSession().getAttribute("user"); // 여기서문제는 세션에 유저가 없을때도 게시물은 볼 수 있어야 하는데, 세션에 유저가 없을때
																	// 페이지 실행을 하면 nullpoint에러 남
		ParticipationVO isParticipation = null;
		LikeVO isLike = null;
		if (uVO != null) {
			isLike = boardService.isLike(boardNum, uVO.getUserEmail());

			isParticipation = boardService.isParticipation(boardNum, uVO.getUserEmail()); // 참여내역 넘기기
		}
		mv.addObject("isLike", isLike);
		mv.addObject("isParticipation", isParticipation);

		String subType = getBoard.getBoardSubtype();

		if (subType.equals("VS")) { // 서브타입이 VS일때
			ArrayList<vsTypeVO> vs = boardService.getSubVS(getBoard.getBoardNum());
			for (vsTypeVO tmp : vs) {
				if (tmp.getyORn().equals("Y")) {
					vsTypeVO yes = tmp;
					mv.addObject("yes", yes);

				} else {
					vsTypeVO no = tmp;
					mv.addObject("no", no);

				}
			}

		} else if (subType.equals("SURVEY")) { // 서브타입이 SURVEY일때
			//ArrayList<surveyTypeVO> survey = boardService.getSubSURVEY(getBoard.getBoardNum());
			//System.out.println("설문형 리스트 "+survey);
			//mv.addObject("surveyList", survey);
			//위에 세줄은 부모/자식 구분없이 리스트로 가져온것을 보내준 것
			
			//지금부터 할 것은 부모, 자식 리스트를 구별해서 가져올 것임
			ArrayList<surveyTypeVO> Psurvey = boardService.getPsurvey(getBoard.getBoardNum());
			ArrayList<surveyTypeVO> Asurvey = boardService.getAsurvey(getBoard.getBoardNum());
			
			mv.addObject("Psurvey", Psurvey);
			mv.addObject("Asurvey", Asurvey);
			
		}

		// 댓글관련
		ArrayList<CommentVO> commentList = boardService.getCommentList(boardNum);
		// System.out.println("리스트 길이 알아본다"+commentList.size());
		mv.addObject("commentList", commentList);
		mv.addObject("commentListSize", commentList.size());

		mv.addObject("board", getBoard);
		mv.setViewName("/board/view");
		return mv;
	}

	@RequestMapping(value = "/board/view", method = RequestMethod.POST)
	public String viewPost(Model model, ParticipationVO pVO, Integer[] participationSurveyTypeNum) {
		logger.info("설문결과 DB에 저장하는 중");
		if(pVO.getBoardSubtype().equals("VS")) {
			boardService.addSubRes_vs(pVO);
		}else if(pVO.getBoardSubtype().equals("SURVEY")) {
			boardService.addSubRes_survey(pVO,participationSurveyTypeNum);
		}
		
		model.addAttribute("boardNum", pVO.getParticipationBoardNum());
		

		return "redirect:/board/view";
	}

	
	
	
	
	// 댓글 관련 컨트롤러------------------------------------------------------------------------------

	@RequestMapping(value = "/board/comment", method = RequestMethod.POST)
	public String commentPost(Model model, CommentVO cVO) {
		logger.info("댓글 DB에 저정하는 중");
		System.out.println(cVO);
		boardService.addComment(cVO);
		model.addAttribute("boardNum", cVO.getCommentBoardNum());

		return "redirect:/board/view";
	}

	// 공감버튼 관련 컨트롤러-------------------------------------------------------------------------------

	@RequestMapping(value = "/board/like", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> likePost(LikeVO lVO) {
		Map map = new HashMap<String, String>();

		boardService.addLike(lVO);
		map.put("data", true);
		return map;

	}

}
