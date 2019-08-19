package kr.green.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.portfolio.dao.UserDAO;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	UserDAO userDao;

	@Override
	public boolean repetitionCheck(String user_email) {
		if(user_email == null) {
			return false;
		}else {
			if(userDao.getUser(user_email) == null) {
				return false;
			}else {
				return true;
			}
		}
		
	}

}
