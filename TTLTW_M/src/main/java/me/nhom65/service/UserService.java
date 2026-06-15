package me.nhom65.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import me.nhom65.dao.OtpDAO;
import me.nhom65.dao.UserDAO;
import me.nhom65.model.OTP;
import me.nhom65.model.User;
import me.nhom65.util.enums.OTPType;

public class UserService {
	
	private UserDAO userDAO;
	private OtpDAO otpDAO;
	private MailService mailService;
	
	public UserService() {
		this.userDAO = new UserDAO();
		this.otpDAO = new OtpDAO();
		this.mailService = new MailService();
	}
	
	public List<User> getAllUsers(){
		return this.userDAO.getAllUsers();
	}
	
	public User getUserByName(String username) {
		if(username == null || username.isBlank()) return null;
        return userDAO.findByUsername(username);
    }
	public boolean addUser(String username, String password, String confirmPassword, String gmail, String phone, String address) {
		return userDAO.createUser(username, confirmPassword, gmail, phone, address);
	}

	public boolean createOtpAndSend(String username, OTPType type, LocalDateTime time) {
		if(username == null || username.isBlank()) {
			return false;
		}
		User user = userDAO.findByUsername(username);
		if(user == null) {
			return false;
		}
		return createOtp(user,type,time, true);
	}
	private boolean createOtp(User user, OTPType type, LocalDateTime time, boolean sendmail) {
		ThreadLocalRandom r = ThreadLocalRandom.current();
		int randomvalue = r.nextInt(0, 1000000);
		String otp = String.format("%06d", randomvalue);
		boolean b =  otpDAO.createOtp(user, type, otp, Timestamp.valueOf(time));
		if(b && sendmail) {
			mailService.sendOTP(user.getEmail(), otp);
			return true;
		}
		return false;
	}
	
	public boolean isOtpExpired(String username, OTPType type) {
		OTP get = getOtp(username, type);
		if(get != null) {
			
		}
		return false;	
	}
	
	public OTP getOtp(String username, OTPType type) {
		if(username == null || username.isBlank()) {
			return null;
		}
		return otpDAO.getOtp(username,type);
	}

	public User getUserByEmail(String email) {
		return userDAO.findByEmail(email);
	}

	public OTP getOtp(String username, OTPType type, String otp) {
		if(username == null || username.isBlank()) {
			return null;
		}
		return otpDAO.getOtpFromCode(username,type,otp);
	}
	
	public boolean activeOtp(int i, OTPType type, String otp) {
		return otpDAO.activeOTP(i, type, otp);
	}
	public boolean isUnActiveOtp(String username, OTPType type) {
		if(username == null || username.isBlank()) {
			return false;
		}
		return otpDAO.isUnActiveOTP(username, type);
	}
	
	
}
