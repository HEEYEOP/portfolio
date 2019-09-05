package kr.green.portfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.BoardDAO;
import kr.green.portfolio.vo.FieldVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<FieldVO> getFieldList() {
		
		return boardDao.getFieldList();
	}
	

}
