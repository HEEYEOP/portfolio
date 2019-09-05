package kr.green.portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;

public interface BoardDAO {

	ArrayList<FieldVO> getFieldList();

	void insertBoard(BoardVO bVO);
	
	int getBoardNum();

	void insertFile(FileVO file);

}
