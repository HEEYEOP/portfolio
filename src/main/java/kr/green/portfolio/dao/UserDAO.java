package kr.green.portfolio.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.portfolio.vo.UserVO;

public interface UserDAO {
	public String getEmail(String userEmail);

	public UserVO getUser(String userEmail);

	public void insertUser(UserVO uVO);

	public UserVO getConfirmUser(String recipient);

	public void insertConfirmNum(@Param("recipient") String recipient, @Param("confirmNum") String confirmNum);

}
