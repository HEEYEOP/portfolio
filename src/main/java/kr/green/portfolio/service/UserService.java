package kr.green.portfolio.service;

import kr.green.portfolio.vo.UserVO;

public interface UserService {

	boolean repetitionCheck(String userEmail);

	void enrollUser(UserVO uVO);

}
