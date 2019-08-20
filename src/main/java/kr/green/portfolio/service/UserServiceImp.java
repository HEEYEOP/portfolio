package kr.green.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.UserDAO;
import kr.green.portfolio.vo.UserVO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	UserDAO userDao;

	@Override
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

	@Override
	public void enrollUser(UserVO uVO) {
		userDao.insertUser(uVO);
		
	}

}
