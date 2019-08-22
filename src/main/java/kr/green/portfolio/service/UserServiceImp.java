package kr.green.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.UserDAO;
import kr.green.portfolio.vo.UserVO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	UserDAO userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override //회원가입시, 중복확인메소드
	public boolean repetitionCheck(String userEmail) {
		if(userEmail == null) {
			return false;
		}else {
			if(userDao.getUser(userEmail) == null) {
				return false;
			}else {
				return true;
			}
		}
	}

	@Override //회원가입메소드
	public void enrollUser(UserVO uVO) {
		String encodePw = passwordEncoder.encode(uVO.getUserPw());
		uVO.setUserPw(encodePw);
		
		if(uVO.getUserType().equals("GroupUser")) {
			uVO.setIsMember("N");
		}else{
			uVO.setIsMember("Y");
		}
		
		userDao.insertUser(uVO);
	}

	@Override
	public boolean login(UserVO uVO) {
		UserVO getUser= userDao.getUser(uVO.getUserEmail());
				
		if(uVO == null){
			return false;
		}else if(getUser == null) {
			return false;
		}else if(!passwordEncoder.matches(uVO.getUserPw(), getUser.getUserPw())) {
			return false;
		}
		return true;
		
	}

	@Override
	public boolean matchEmailandType(String userType, String userEmail) {
		UserVO getUser = userDao.getUser(userEmail);
		if(userType == ""|| userEmail == "") {
			return false;
		}else if(getUser == null) {
			return false;
		}if(!getUser.getUserType().equals(userType)) {
			return false;
		}
		return true;
	}
}
