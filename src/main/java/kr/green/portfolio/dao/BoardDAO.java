package kr.green.portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.CommentVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.LikeVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.surveyTypeVO;
import kr.green.portfolio.vo.vsTypeVO;

public interface BoardDAO {

	ArrayList<FieldVO> getFieldList();

	void insertBoard(BoardVO bVO);
	
	void updateWriteBoardCount(String boardUserEmail);
	
	int getBoardNum();

	void insertFile(FileVO file);

	void insertVsType(vsTypeVO vsVO);

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(int boardNum);

	ArrayList<vsTypeVO> getSubVS(int boardNum);

	void addSubRes_vs(ParticipationVO pVO);

	void updateSubRes_vs(int participationVsTypeNum);

	void updateViewsCount(int boardNum);

	ArrayList<ParticipationVO> isParticipation(@Param("boardNum")int boardNum,@Param("userEmail")String userEmail);

	//댓글 관련----------------------------------
	void insertComment(CommentVO cVO);

	void updateWriteCommentCount(String commentUserEmail);

	void updateCommentsCount(int commentBoardNum);
	
	ArrayList<CommentVO> getCommentList(int boardNum);
	
	
	//공감 관련-----------------------------------------------
	LikeVO getLike(@Param("likeBoardNum")int likeBoardNum, @Param("likeUserEmail")String likeUserEmail);

	void addLike(LikeVO lVO);

	void updateLike(@Param("likeNum")int likeNum, @Param("isLike")String isLike);

	void updateLikesCount(int likeBoardNum);

	void updateLikesBoardCount(String likeUserEmail);

	void updateLikesCount2(int likeBoardNum);

	void updateLikesBoardCount2(String likeUserEmail);

	
	//서브타입_ 설문형 관련--------------------------------------
	void insertSurveyType(surveyTypeVO sVO);

	int getParentsNum();

	surveyTypeVO getParentSurvey(int parentsNum);

	ArrayList<surveyTypeVO> getSubSURVEY(int boardNum);

		//부모, 자식 나눠서 리스트로 가져오는 일을 시킬 것
	ArrayList<surveyTypeVO> getPsurvey(int boardNum);

	ArrayList<surveyTypeVO> getAsurvey(int boardNum);

	int getTotalPartiNum(int boardNum);

	

	
	

}
