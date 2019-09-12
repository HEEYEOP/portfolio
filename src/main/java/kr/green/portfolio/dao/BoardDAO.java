package kr.green.portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.vsTypeVO;

public interface BoardDAO {

	ArrayList<FieldVO> getFieldList();

	void insertBoard(BoardVO bVO);
	
	int getBoardNum();

	void insertFile(FileVO file);

	void insertVsType(vsTypeVO vsVO);

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(int boardNum);

	ArrayList<vsTypeVO> getSubVS(int boardNum);

	void addSubRes_vs(ParticipationVO pVO);

	void updateSubRes_vs(int participationVsTypeNum);

	void updateViewsCount(int boardNum);

}
