package me.nhom65.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import me.nhom65.util.JavaMail;



public class MailService {
	
	 private Session createSession() {
	        Properties props = JavaMail.getMailProperties();

	        return Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(
	                		JavaMail.getUsername(),
	                        JavaMail.getPassword()
	                );
	            }
	        });
	    }
	public void sendEmail(String to, String subject, String content) {
        try {
            MimeMessage message = new MimeMessage(createSession());
            message.setFrom(new InternetAddress(JavaMail.getUsername()));
            message.setRecipients(
            		MimeMessage.RecipientType.TO,
                    InternetAddress.parse(to)
            );
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8");

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException("Send email failed", e);
        }
    }
//	public void sendForgotPassword(String email,String password_hash) {
//		 if(email.isBlank()) return;
//		  String password = PasswordEncoding.decodingPassword(password_hash);
//		  String subject = "Web bán sách gửi lại mật khẩu";
//		  String content = """
//		            <h3>Chào bạn,</h3>
//		            <p>Mật khẩu của bạn là:</p>
//		            <a>%s</a>
//		        """.formatted(password);
//		  sendEmail(email,subject,content);
//	}
	public void sendOTPRegister(String email, String otp) {
		 if(email.isBlank()) return;
		 String subject = "Gửi mã OTP Đăng Ký";
		 String content = """
		            <h3>Chào bạn,</h3>
		            <p>Gmail của bạn đã được đăng ký vói web thuốc BVTV</p>
		            <p>Mã otp của bạn là:</p>
		            <a>%s</a>
		            <p>Nhập OTP lên web để hoàn tất việc đăng ký !</p>
		            <p>Có hiệu lực trong 30 phút !</p>
		            <p>Hãy bỏ qua nếu có người dùng đăng ký bất hợp pháp</p>
		        """.formatted(otp);
		  sendEmail(email,subject,content);
		}
	public void sendOTP(String email, String otp) {
	 if(email.isBlank()) return;
	 String subject = "Gửi mã OTP Quên Mật Khẩu";
	 String content = """
	            <h3>Chào bạn,</h3>
	            <p>Tài khoản của bạn hiện đang quên mật khẩu </p>
	            <p>Mã otp của bạn là:</p>
	            <a>%s</a>
	            <p>Nhập OTP lên web để reset mật khẩu ngay!</p>
	            <p>Có hiệu lực trong 30 phút !</p>
		        <p>Hãy bỏ qua nếu có người dùng đòi đổi mật khẩu bất hợp pháp</p>
	        """.formatted(otp);
	  sendEmail(email,subject,content);
	}
}
