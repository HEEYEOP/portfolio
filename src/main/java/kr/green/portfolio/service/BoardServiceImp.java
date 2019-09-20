package kr.green.portfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.BoardDAO;
import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.CommentVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.LikeVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.surveyTypeVO;
import kr.green.portfolio.vo.vsTypeVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<FieldVO> getFieldList() {
		return boardDao.getFieldList();
	}

	@Override
	public int addBoard(BoardVO bVO) {
		if(bVO == null)
			return -1;
		if(bVO.getBoardSubtype() == null) {
			bVO.setBoardSubtype("NONE"); //이거 제대로 동작 안함	
		}
		boardDao.insertBoard(bVO);
		boardDao.updateWriteBoardCount(bVO.getBoardUserEmail());
		int getBoardNum = boardDao.getBoardNum();
		return getBoardNum;
	}

	@Override
	public void addFile(FileVO file) {
		if(file == null)
			return ;
		
		boardDao.insertFile(file);
	}

	@Override
	public void addVsType(int boardNum ,String[] vsContents) {
		vsTypeVO vsVO = new vsTypeVO();
		vsVO.setVsTypeBoardNum(boardNum);
		for(String tmp : vsContents) {
			if(tmp == vsContents[0]) {
				vsVO.setVsContents(tmp);
				if(tmp.equals("")) {
					vsVO.setVsContents("찬성");
				}
				vsVO.setyORn("Y");
				
			}else {
				vsVO.setVsContents(tmp);
				if(tmp.equals("")) {
					vsVO.setVsContents("반대");
				}
				vsVO.setyORn("N");
			}
			/* System.out.println(vsVO); */
			boardDao.insertVsType(vsVO);
		}
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.getBoardList();
	}

	@Override
	public BoardVO getBoard(int boardNum) {
		BoardVO getBoard = boardDao.getBoard(boardNum);
		return getBoard;
	}

	@Override
	public ArrayList<vsTypeVO> getSubVS(int boardNum) {
		ArrayList<vsTypeVO> sub = boardDao.getSubVS(boardNum);
		return sub;
	}

	@Override
	public void addSubRes_vs(ParticipationVO pVO) {
		if(pVO.getBoardSubtype().equals("VS")) {
			boardDao.addSubRes_vs(pVO);
			boardDao.updateSubRes_vs(pVO.getParticipationVsTypeNum());	
			//boardDao.plusTotalNum_vs(pVO.getParticipationVsTypeNum()) //이거해야되는거같은데, 구현 안해서 주석처리 해놓은것으로 보임
		}
	}

	@Override
	public void updateViewsCount(int boardNum) {
		boardDao.updateViewsCount(boardNum);
	}

	@Override
	public ArrayList<ParticipationVO> isParticipation(int boardNum, String userEmail) {
		if(userEmail == null)
			return null;
		
		ArrayList<ParticipationVO> isParticipation = boardDao.isParticipation(boardNum,userEmail);
		
		if(isParticipation == null)
			return null;
		else
			return isParticipation;
		
	}

	
	
	//댓글관련 기능---------------------------------------------------------------
	@Override
	public void addComment(CommentVO cVO) {
		if(cVO == null)
			return ;
		boardDao.insertComment(cVO);
		boardDao.updateWriteCommentCount(cVO.getCommentUserEmail());
		boardDao.updateCommentsCount(cVO.getCommentBoardNum());
		
	}

	@Override
	public ArrayList<CommentVO> getCommentList(int boardNum) {
		
		return boardDao.getCommentList(boardNum);
	}

	
	
	//공김버튼 관련 기능-----------------------------------------------------------
	@Override
	public void addLike(LikeVO lVO) {
		
		if(lVO == null) 
			return ;
		
		LikeVO oldLike = boardDao.getLike(lVO.getLikeBoardNum(),lVO.getLikeUserEmail());
		
		if(oldLike == null) { 
			boardDao.addLike(lVO); 
			boardDao.updateLikesCount(lVO.getLikeBoardNum()); //게시물에 1증가
			boardDao.updateLikesBoardCount(lVO.getLikeUserEmail()); //사용자에 1증가
		}else {
			boardDao.updateLike(oldLike.getLikeNum(),lVO.getIsLike());
			if(lVO.getIsLike().equals("N")) {
				boardDao.updateLikesCount2(lVO.getLikeBoardNum()); //게시물에 1감소
				boardDao.updateLikesBoardCount2(lVO.getLikeUserEmail()); //사용자에 1감소
			}else {
				boardDao.updateLikesCount(lVO.getLikeBoardNum()); //게시물에 1증가
				boardDao.updateLikesBoardCount(lVO.getLikeUserEmail()); //사용자에 1증가
			}
		}
		 
		 
		
	}

	@Override
	public LikeVO isLike(int boardNum, String userEmail) {
		
		return boardDao.getLike(boardNum, userEmail);
	}

	
	
	
	
	
	
	
	//서브타입이 설문형 일 때, 
	@Override
	public void addSurveyType(int boardNum, String qcntArray, String[] questionType, String[] isEssential,
			String[] surveyContents, int[] maxSelectNum) {

		/*
		//이거 나중에 지울꺼야_잘 넘어오는거 확인하는거일뿐
		System.out.println("질문갯수_배열생성");
		System.out.println(QcntArray); //출력 ---  ex) 2,1
		
		System.out.println("질문타입");
		for(String tmp : questionType) {
			System.out.println("["+tmp+"]");
		}
		System.out.println("필수여부");
		for(String tmp : isEssential) {
			System.out.println("["+tmp+"]");
		}
		System.out.println("질문및보기내용");
		for(String tmp : surveyContents) {
			System.out.println("["+tmp+"]");
		}
		System.out.println("복수선택갯수");
		for(Integer tmp : maxSelectNum) {
			System.out.println("["+tmp+"]");
		}
		*/
		
		
		
		String[] cntArr = qcntArray.split(",");
	
		//서브타입 질문 등록
		int index = 0;
		for(int i=0; i<cntArr.length; i++) {
			surveyTypeVO sVO = new surveyTypeVO();
			sVO.setSurveyTypeBoardNum(boardNum);
			sVO.setQuestionType(questionType[i]);
			sVO.setIsEssential(isEssential[i]);
			sVO.setSurveyContents(surveyContents[index++]);
			sVO.setDepth(1);
			sVO.setParentsQ(0);
			sVO.setMaxSelectNum(maxSelectNum[i]);
		
			//System.out.println("이거 일단 부모로 넣을 얘의 정보"+ sVO);
			
			boardDao.insertSurveyType(sVO);
			int parentsNum = boardDao.getParentsNum();
			surveyTypeVO parentSurvey = boardDao.getParentSurvey(parentsNum); 
			//System.out.println("직전에 DB에 저장한 부모질문 가져오기 "+ parentSurvey); //잘가져와짐
			
			
			if(cntArr[i] != null) {
				int val = Integer.parseInt(cntArr[i]);
				for(int j=0; j<val; j++) {
					
					surveyTypeVO ssVO = new surveyTypeVO();
					
					ssVO.setSurveyTypeBoardNum(parentSurvey.getSurveyTypeBoardNum());
					ssVO.setQuestionType(parentSurvey.getQuestionType());
					ssVO.setIsEssential(parentSurvey.getIsEssential());
					ssVO.setSurveyContents(surveyContents[index++]); //여기 index++이 어떻게 동작하는지 생각해보기 //얘 잘넘어오는것 확인함
					ssVO.setDepth(2);
					ssVO.setParentsQ(parentSurvey.getSurveyTypeNum());
					ssVO.setMaxSelectNum(parentSurvey.getMaxSelectNum());
					
					boardDao.insertSurveyType(ssVO);
					
				}
				
			}
			
			
			
			
			
		}
		
		
		
		
		
	}

	@Override
	public ArrayList<surveyTypeVO> getSubSURVEY(int boardNum) {
		
		return boardDao.getSubSURVEY(boardNum);
	}

	@Override
	public ArrayList<surveyTypeVO> getPsurvey(int boardNum) {
		
		return boardDao.getPsurvey(boardNum);
	}

	@Override
	public ArrayList<surveyTypeVO> getAsurvey(int boardNum) {
		
		return boardDao.getAsurvey(boardNum);
	}

	@Override
	public void addSubRes_survey(ParticipationVO pVO, Integer[] participationSurveyTypeNum) {
		
		if(pVO.getBoardSubtype().equals("SURVEY")) {
			for(int tmp : participationSurveyTypeNum) {
				pVO.setParticipationSurveyTypeNum(tmp);
				boardDao.addSubRes_vs(pVO);
			}
			
			//boardDao.updateSubRes_vs(pVO.getParticipationVsTypeNum());	
			//boardDao.plusTotalNum_vs(pVO.getParticipationVsTypeNum()) //이거해야되는거같은데, 구현 안해서 주석처리 해놓은것으로 보임
		}
		
	}

	

}
