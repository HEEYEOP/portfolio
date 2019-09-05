package kr.green.portfolio.service;

import java.util.ArrayList;

import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;

public interface BoardService {

	ArrayList<FieldVO> getFieldList();

	int addBoard(BoardVO bVO);

	void addFile(FileVO file);

}
