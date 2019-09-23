package kr.green.portfolio.service;

import java.util.ArrayList;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.CommentVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.LikeVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.surveyTypeVO;
import kr.green.portfolio.vo.vsTypeVO;

public interface BoardService {

	ArrayList<FieldVO> getFieldList();

	int addBoard(BoardVO bVO);

	void addFile(FileVO file);

	void addVsType(int boardNum, String[] vsContents);

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(int boardNum);

	ArrayList<vsTypeVO> getSubVS(int boardNum);

	void addSubRes_vs(ParticipationVO pVO);

	void updateViewsCount(int boardNum);

	ArrayList<ParticipationVO> isParticipation(int boardNum, String userEmail);

	void addComment(CommentVO cVO);

	ArrayList<CommentVO> getCommentList(int boardNum);

	void addLike(LikeVO lVO);

	LikeVO isLike(int boardNum, String userEmail);

	
	//서브타입이 설문형 일때, 
	void addSurveyType(int boardNum, String QcntArray, String[] questionType, String[] isEssential,
			String[] surveyContents, String[] maxSelectNum);

	ArrayList<surveyTypeVO> getSubSURVEY(int boardNum);

		//아래부터는 부모, 자식 설문 따로 나눠서 가져오는 작업에 대한 서비스
	ArrayList<surveyTypeVO> getPsurvey(int boardNum);

	ArrayList<surveyTypeVO> getAsurvey(int boardNum);

	void addSubRes_survey(ParticipationVO pVO, Integer[] participationSurveyTypeNum);


	

}
