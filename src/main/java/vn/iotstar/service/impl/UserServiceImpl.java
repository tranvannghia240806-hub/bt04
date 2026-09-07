package vn.iotstar.service.impl;

import java.util.Date;

import javax.mail.MessagingException;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.util.Constant;
import vn.iotstar.util.MailUtil;
import vn.iotstar.util.OtpUtil;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassWord())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (userDao.checkExistUsername(username)) {
            return false;
        }
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        User user = new User(email, username, fullname, password, null, 5, phone, date);
        user.setActive(false);
        generateAndAttachOtp(user);

        userDao.insert(user);
        sendOtpMailSafely(email, "Xác thực tài khoản - Shopping IOTStar", user.getOtpCode(), "kích hoạt tài khoản");
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }

    @Override
    public boolean verifyOtp(String username, String otp) {
        User user = userDao.get(username);
        if (!isOtpValid(user, otp)) {
            return false;
        }
        user.setActive(true);
        clearOtp(user);
        userDao.update(user);
        return true;
    }

    @Override
    public boolean resendOtp(String username) {
        User user = userDao.get(username);
        if (user == null || user.isActive()) {
            return false;
        }
        generateAndAttachOtp(user);
        userDao.update(user);
        return sendOtpMailSafely(user.getEmail(), "Mã OTP mới - Shopping IOTStar",
                user.getOtpCode(), "kích hoạt tài khoản");
    }

    @Override
    public boolean sendForgotPasswordOtp(String username, String email) {
        User user = userDao.get(username);
        if (user == null || user.getEmail() == null || !user.getEmail().equalsIgnoreCase(email)) {
            return false;
        }
        generateAndAttachOtp(user);
        userDao.update(user);
        return sendOtpMailSafely(email, "Mã OTP đặt lại mật khẩu - Shopping IOTStar",
                user.getOtpCode(), "đặt lại mật khẩu");
    }

    @Override
    public boolean resetPasswordWithOtp(String username, String otp, String newPassword) {
        User user = userDao.get(username);
        if (!isOtpValid(user, otp)) {
            return false;
        }
        user.setPassWord(newPassword);
        clearOtp(user);
        userDao.update(user);
        return true;
    }

    private void generateAndAttachOtp(User user) {
        String otp = OtpUtil.generateOtp();
        user.setOtpCode(otp);
        user.setOtpExpire(new Date(System.currentTimeMillis() + Constant.OTP_EXPIRE_MINUTES * 60 * 1000L));
        System.out.println("[OTP DEBUG] username=" + user.getUserName()
                + " | email=" + user.getEmail()
                + " | otp=" + otp
                + " | het han sau " + Constant.OTP_EXPIRE_MINUTES + " phut");
    }

    private void clearOtp(User user) {
        user.setOtpCode(null);
        user.setOtpExpire(null);
    }

    private boolean isOtpValid(User user, String otp) {
        if (user == null || otp == null || user.getOtpCode() == null || user.getOtpExpire() == null) {
            return false;
        }
        if (!user.getOtpCode().equals(otp.trim())) {
            return false;
        }
        return new Date().before(user.getOtpExpire());
    }

    @Override
    public User updateProfile(String username, String fullname, String phone, String avatar) {
        User user = userDao.get(username);
        if (user == null) {
            return null;
        }
        if (fullname != null) {
            user.setFullName(fullname);
        }
        if (phone != null) {
            user.setPhone(phone);
        }
        if (avatar != null) {
            user.setAvatar(avatar);
        }
        userDao.update(user);
        return user;
    }

    private boolean sendOtpMailSafely(String email, String subject, String otp, String purposeText) {
        try {
            MailUtil.sendOtpEmail(email, subject, otp, purposeText);
            System.out.println("[OTP MAIL] Gửi thành công tới " + email);
            return true;
        } catch (MessagingException e) {
            System.out.println("[OTP MAIL] *** GỬI THẤT BẠI tới " + email + " -> " + e.getClass().getSimpleName()
                    + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
