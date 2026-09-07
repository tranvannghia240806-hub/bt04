package vn.iotstar.service;

import vn.iotstar.model.User;

public interface UserService {
    void insert(User user);
    User get(String username);
    User login(String username, String password);
    boolean register(String username, String password, String email, String fullname, String phone);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    boolean verifyOtp(String username, String otp);
    boolean resendOtp(String username);
    boolean sendForgotPasswordOtp(String username, String email);
    boolean resetPasswordWithOtp(String username, String otp, String newPassword);

    User updateProfile(String username, String fullname, String phone, String avatar);
}
