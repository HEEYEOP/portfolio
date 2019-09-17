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
	public void addSubRes(ParticipationVO pVO) {
		if(pVO.getBoardSubtype().equals("VS")) {
			boardDao.addSubRes_vs(pVO);
			boardDao.updateSubRes_vs(pVO.getParticipationVsTypeNum());
			
			
			//boardDao.plusTotalNum_vs(pVO.getParticipationVsTypeNum())
		}else {
			
		}
		
		
	}

	@Override
	public void updateViewsCount(int boardNum) {
		boardDao.updateViewsCount(boardNum);
	}

	@Override
	public ParticipationVO isParticipation(int boardNum, String userEmail) {
		if(userEmail == null)
			return null;
		
		ParticipationVO isParticipation = boardDao.isParticipation(boardNum,userEmail);
		
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

	

}
