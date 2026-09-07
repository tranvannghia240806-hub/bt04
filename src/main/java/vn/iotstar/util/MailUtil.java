package vn.iotstar.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

    public static void sendOtpEmail(String toEmail, String subject, String otpCode, String purposeText)
            throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", Constant.MAIL_HOST);
        props.put("mail.smtp.port", Constant.MAIL_PORT);

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Constant.MAIL_USERNAME, Constant.MAIL_PASSWORD);
            }
        });

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(Constant.MAIL_USERNAME, Constant.MAIL_FROM_NAME));
        } catch (java.io.UnsupportedEncodingException e) {
            message.setFrom(new InternetAddress(Constant.MAIL_USERNAME));
        }
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject, "UTF-8");

        String html = "<div style='font-family:Arial,sans-serif;font-size:15px;color:#1f2937'>"
                + "<p>Xin chào,</p>"
                + "<p>Bạn (hoặc ai đó dùng email này) vừa yêu cầu <b>" + purposeText + "</b> "
                + "trên hệ thống <b>Shopping IOTStar</b>.</p>"
                + "<p>Mã OTP của bạn là:</p>"
                + "<p style='font-size:28px;font-weight:700;letter-spacing:4px;color:#4f46e5'>" + otpCode + "</p>"
                + "<p>Mã có hiệu lực trong <b>" + Constant.OTP_EXPIRE_MINUTES + " phút</b>. "
                + "Vui lòng không chia sẻ mã này cho bất kỳ ai.</p>"
                + "<p>Nếu không phải bạn thực hiện yêu cầu này, vui lòng bỏ qua email.</p>"
                + "</div>";
        message.setContent(html, "text/html; charset=UTF-8");

        Transport.send(message);
    }
}
