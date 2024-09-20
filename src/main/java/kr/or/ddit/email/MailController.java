package kr.or.ddit.email;


import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.orders.service.OrderService;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;


@Controller
@RequestMapping("/email")
public class MailController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrdersApplyMapper oaMapper;

	private static final Logger logger = LoggerFactory.getLogger(MailController.class);

	@PostMapping
	public String mailSend(HttpServletRequest request) {
		//https://temp-mail.org/ko/
        String to = ""; // Receiver's email
        String from = ""; // Sender's email
        String password = ""; // Sender's email
        String body = request.getParameter("date"); // Email body
        String subject = "H호텔 발주 이메일"; // Email subject
        String host = "smtp.naver.com";
        String htmlTable = request.getParameter("htmlTable");


        // SMTP 프로토콜 설정
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", host);
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
        	 // 메일 내용 작성
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject(subject);
            msg.setText("납기일 :"+body);
            msg.setContent("<html>"+htmlTable+"</html>","text/html; charset=UTF-8");

            // 메일 보내기
            Transport.send(msg);

            orderService.modifyorders("진행중",request.getParameter("orderApplyNo"));
    		oaMapper.modifyorders("진행중",request.getParameter("orderApplyNo"));

            logger.info("Email sent successfully to {}", to);

        } catch (Exception e) {
            logger.error("Error occurred while sending email", e);
        }

        return "redirect:/orders/ordersList.do";
    }

}