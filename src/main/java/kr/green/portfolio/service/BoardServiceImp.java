package kr.green.portfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.BoardDAO;
import kr.green.portfolio.vo.BoardVO;
import kr.green.portfolio.vo.FieldVO;
import kr.green.portfolio.vo.FileVO;

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
		
		boardDao.insertBoard(bVO);
		int getBoardNum = boardDao.getBoardNum();
		return getBoardNum;
	}

	@Override
	public void addFile(FileVO file) {
		if(file == null)
			return ;
		
		boardDao.insertFile(file);
	}
	

}
