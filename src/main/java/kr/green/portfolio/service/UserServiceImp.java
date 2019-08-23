package kr.green.portfolio.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	private JavaMailSender mailSender;

	@Override //회원가입시, 중복확인메소드
	public boolean repetitionCheck(String userEmail) {
		if(userEmail == "") {
			return true;
		}else if(userDao.getUser(userEmail) == null) {
				return false;
		}else {
				return true;
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
	
	@Override 
	public String createPw() { 
		String str ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		String pw=""; 
		for(int i=0; i< 8; i++) { 
			int r = (int)(Math.random()*62); 
			pw += str.charAt(r); 
		} 
		return pw; 
	} 
	
	@Override 
	public void sendMail(String email, String title, String contents) { 
		String setfrom = "jyihyo1321@gmail.com";          
	    try { 
	        MimeMessage message = mailSender.createMimeMessage(); 
	        MimeMessageHelper messageHelper  
	            = new MimeMessageHelper(message, true, "UTF-8"); 
	         
	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함 
	        messageHelper.setTo(email);     // 받는사람 이메일 
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다 
	        messageHelper.setText(contents);  // 메일 내용 
 
	        mailSender.send(message); 
	    } catch(Exception e){ 
	        System.out.println(e); 
	    } 
	}

	@Override
	public void updateSendingNum(String recipient, String sendingNum) { //회원가입 이메일 인증시, 인증번호를 업데이트하는 메소드
		userDao.insertSendingNum(recipient,sendingNum);
		
	} 
}
