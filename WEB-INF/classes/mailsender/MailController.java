package mailsender;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.SecureRandom;

public class MailController extends Thread{
	Properties p = System.getProperties();
	Authenticator auth = new MyAuthentication();//발신자(관리자)의 아이디비번을 가지고있는 개체
    //session 생성 및  MimeMessage생성
    Session session = Session.getDefaultInstance(p, auth);
    MimeMessage msg = new MimeMessage(session);
    private String id;
    private String email;
    private String fakePw;
    
    public MailController() {
    	
    }
    
	public MailController(String id,String email,String fakePw){
		System.out.println("asdasdsadsad");
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "587");                 // 구글 포트
        this.id=id;
        this.email=email;
        this.fakePw=fakePw;
	}
	
	@Override
	public void run() {
		sendPw();
	}
	
	public void sendPw() {
		try {
			msg.setSentDate(new Date());
			InternetAddress from=new InternetAddress();
			from= new InternetAddress("****@gmail.com","박종현"); //발신자 아이디
			 // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);//임시비밀번호를 받아야할 회원의 이메일주소로 전송
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("Pet sitting FINDPW", "UTF-8");
            String testtest="<table class=\"body-wrap\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\">\r\n"
            		+ "    <tbody>\r\n"
            		+ "        <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "            <td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"></td>\r\n"
            		+ "            <td class=\"container\" width=\"600\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\">\r\n"
            		+ "                <div class=\"content\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\">\r\n"
            		+ "                    <table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" itemprop=\"action\" itemscope=\"\" itemtype=\"http://schema.org/ConfirmAction\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; margin: 0; border: none;\">\r\n"
            		+ "                        <tbody><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                            <td class=\"content-wrap\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;padding: 30px;border: 3px solid #67a8e4;border-radius: 7px; background-color: #fff;\" valign=\"top\">\r\n"
            		+ "                                <meta itemprop=\"name\" content=\"Confirm Email\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                    <tbody><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
            		+"<b>"+id+"</b>                                           님 반드시 비밀번호를 변경하시길 바랍니다\r\n"
            		+ "                                        </td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "                                    <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
            		+ "                                            요청하신 임시비밀번호를 발급해 드렸습니다. 로그인 후 반드시 비밀번호 변경을 하시길 바랍니다.\r\n"
            		+ "                                        </td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "                                    <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
            		+ "<h2>"+"임시비밀번호 발급: <b>"+fakePw+"</b></h2>"
            		+ "                                        </b></td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "                                    <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" itemprop=\"handler\" itemscope=\"\" itemtype=\"http://schema.org/HttpActionHandler\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
            		+ "                                            <a href=\"http://localhost:8080/ThrowsGG/join.jsp\" class=\"btn-primary\" itemprop=\"url\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; color: #FFF; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; text-transform: capitalize; background-color: #f06292; margin: 0; border-color: #f06292; border-style: solid; border-width: 8px 16px;\">로그인 하러 가기</a>\r\n"
            		+ "                                        </td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "                                    <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
            		+ "                                            <b>Ki-Chang Ma</b>\r\n"
            		+ "                                            <p>Support Team</p>\r\n"
            		+ "                                        </td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "\r\n"
            		+ "                                    <tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
            		+ "                                        <td class=\"content-block\" style=\"text-align: center;font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0;\" valign=\"top\">\r\n"
            		+ "                                           &copy; 2022 sunmoon\r\n"
            		+ "                                        </td>\r\n"
            		+ "                                    </tr>\r\n"
            		+ "                                </tbody></table>\r\n"
            		+ "                            </td>\r\n"
            		+ "                        </tr>\r\n"
            		+ "                    </tbody></table>\r\n"
            		+ "                </div>\r\n"
            		+ "            </td>\r\n"
            		+ "        </tr>\r\n"
            		+ "    </tbody>\r\n"
            		+ "</table>";
            //이메일 내용
//            msg.setText("안녕하세요 "+id+"님 요청하신 임시비밀번호를 발급해드립니다 임시비밀번호: "+fakePw,"UTF-8");
            msg.setContent(testtest, "text/html; charset=UTF-8"); 
            
            
            javax.mail.Transport.send(msg,msg.getAllRecipients());
		}catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
	}
	public String getRandomPw() {
	
		final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
		
		for (int i = 0; i < 8; i++) {
			int randomIndex = random.nextInt(chars.length());
			sb.append(chars.charAt(randomIndex));
		}
		
		return sb.toString();
	}
}
