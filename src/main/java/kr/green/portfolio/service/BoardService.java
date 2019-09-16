package kr.green.portfolio.service;

import java.util.ArrayList;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;
import kr.green.portfolio.vo.ParticipationVO;
import kr.green.portfolio.vo.vsTypeVO;

public interface BoardService {

	ArrayList<FieldVO> getFieldList();

	int addBoard(BoardVO bVO);

	void addFile(FileVO file);

	void addVsType(int boardNum, String[] vsContents);

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(int boardNum);

	ArrayList<vsTypeVO> getSubVS(int boardNum);

	void addSubRes(ParticipationVO pVO);

	void updateViewsCount(int boardNum);

	ParticipationVO isParticipation(int boardNum, String userEmail);


	

}
