package kr.green.portfolio.service;

import kr.green.portfolio.vo.UserVO;

public interface UserService {

	boolean repetitionCheck(String userEmail);

	void enrollUser(UserVO uVO);

	UserVO login(UserVO uVO);

	boolean matchEmailandType(String userType, String userEmail);
	
	public String createPw();
	
	public void sendMail(String email, String title, String contents);

	String matchPhoneandName(String str);
	
	

	
	
	

}
