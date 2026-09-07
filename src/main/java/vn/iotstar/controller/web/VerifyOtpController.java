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

@WebServlet(urlPatterns = "/verify-otp")
public class VerifyOtpController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String resend = req.getParameter("resend");

        if (username == null || username.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/register");
            return;
        }

        if ("1".equals(resend)) {
            boolean ok = userService.resendOtp(username);
            req.setAttribute("alert", ok
                    ? "Đã gửi lại mã OTP mới, vui lòng kiểm tra email."
                    : "Không thể gửi lại OTP (tài khoản đã kích hoạt hoặc không tồn tại).");
        }

        req.setAttribute("username", username);
        RequestDispatcher dispatcher = req.getRequestDispatcher(Constant.Path.VERIFY_OTP);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String otp = req.getParameter("otp");

        if (username == null || otp == null || username.isEmpty() || otp.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập mã OTP!");
            req.setAttribute("username", username);
            req.getRequestDispatcher(Constant.Path.VERIFY_OTP).forward(req, resp);
            return;
        }

        boolean isSuccess = userService.verifyOtp(username, otp);
        if (isSuccess) {
            req.setAttribute("alert", "Kích hoạt tài khoản thành công! Vui lòng đăng nhập.");
            req.getRequestDispatcher(Constant.Path.LOGIN).forward(req, resp);
        } else {
            req.setAttribute("alert", "Mã OTP không đúng hoặc đã hết hạn. Vui lòng thử lại hoặc gửi lại mã.");
            req.setAttribute("username", username);
            req.getRequestDispatcher(Constant.Path.VERIFY_OTP).forward(req, resp);
        }
    }
}
