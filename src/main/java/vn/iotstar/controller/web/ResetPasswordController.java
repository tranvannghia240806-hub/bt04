package vn.iotstar.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        if (username == null || username.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }
        req.setAttribute("username", username);
        RequestDispatcher dispatcher = req.getRequestDispatcher(Constant.Path.RESET_PASSWORD);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String otp = req.getParameter("otp");
        String newPassword = req.getParameter("newpassword");
        String rePassword = req.getParameter("renewpassword");

        if (username == null || otp == null || newPassword == null
                || username.isEmpty() || otp.isEmpty() || newPassword.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập đầy đủ thông tin!");
            req.setAttribute("username", username);
            req.getRequestDispatcher(Constant.Path.RESET_PASSWORD).forward(req, resp);
            return;
        }

        if (!newPassword.equals(rePassword)) {
            req.setAttribute("alert", "Mật khẩu nhập lại không khớp!");
            req.setAttribute("username", username);
            req.getRequestDispatcher(Constant.Path.RESET_PASSWORD).forward(req, resp);
            return;
        }

        boolean isSuccess = userService.resetPasswordWithOtp(username, otp, newPassword);
        if (isSuccess) {
            req.setAttribute("alert", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập lại.");
            req.getRequestDispatcher(Constant.Path.LOGIN).forward(req, resp);
        } else {
            req.setAttribute("alert", "Mã OTP không đúng hoặc đã hết hạn, vui lòng thử lại.");
            req.setAttribute("username", username);
            req.getRequestDispatcher(Constant.Path.RESET_PASSWORD).forward(req, resp);
        }
    }
}
