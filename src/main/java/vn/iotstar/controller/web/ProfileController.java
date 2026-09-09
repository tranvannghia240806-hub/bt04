package vn.iotstar.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;
import vn.iotstar.util.ImageUploadHelper;

@WebServlet(urlPatterns = "/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User account = getAccount(req);
        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = userService.get(account.getUserName());
        req.setAttribute("user", user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/profile.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User account = getAccount(req);
        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("UTF-8");
        try {
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");

            String fullname = null, phone = null, avatar = null;
            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    switch (item.getFieldName()) {
                        case "fullname":
                            fullname = item.getString("UTF-8");
                            break;
                        case "phone":
                            phone = item.getString("UTF-8");
                            break;
                    }
                } else if ("avatar".equals(item.getFieldName())) {
                    avatar = ImageUploadHelper.save(item, "avatar", "shopping/avatar");
                }
            }

            User updated = userService.updateProfile(account.getUserName(), fullname, phone, avatar);
            if (updated != null) {
                req.getSession().setAttribute(Constant.SESSION_ACCOUNT, updated);
            }
            resp.sendRedirect(req.getContextPath() + "/profile?success=1");
        } catch (FileUploadException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/profile?error=upload");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/profile?error=upload");
        }
    }

    private User getAccount(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session == null) {
            return null;
        }
        return (User) session.getAttribute(Constant.SESSION_ACCOUNT);
    }
}
