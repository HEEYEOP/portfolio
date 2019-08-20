package kr.green.portfolio.dao;

import kr.green.portfolio.vo.UserVO;

public interface UserDAO {
	public String getEmail(String userEmail);

	public UserVO getUser(String userEmail);

	public void insertUser(UserVO uVO);

}
