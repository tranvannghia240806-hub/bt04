package vn.iotstar.util;

public class Constant {

    // Thư mục lưu file upload (icon danh mục, ảnh sản phẩm, avatar...)
    public static final String DIR = "D:\\upload";

    public static final String SESSION_ACCOUNT = "account";
    public static final String SESSION_USERNAME = "username";
    public static final String COOKIE_REMEMBER = "username";

    public static final int OTP_LENGTH = 6;
    public static final int OTP_EXPIRE_MINUTES = 5;

    // Cấu hình Gmail SMTP: dùng App Password (https://myaccount.google.com/apppasswords), không dùng mật khẩu Gmail thật
    public static final String MAIL_HOST = "smtp.gmail.com";
    public static final String MAIL_PORT = "587";
    public static final String MAIL_USERNAME = "lhtp1902@gmail.com";
    public static final String MAIL_PASSWORD = "ihmr wrci tfhf yekm";
    public static final String MAIL_FROM_NAME = "Shopping IOTStar";

    // API key lấy tại https://api.imgbb.com/ sau khi đăng ký tài khoản tại https://imgbb.com
    public static final String IMGBB_API_KEY = "ca14bdbce516cb2ce00bf5c26ee02806";

    public static final int PRODUCT_PAGE_SIZE = 6;
    public static final int PRODUCT_HOME_LIMIT = 10;

    public static class Path {
        public static final String LOGIN = "/views/login.jsp";
        public static final String REGISTER = "/views/register.jsp";
        public static final String VERIFY_OTP = "/views/verify-otp.jsp";
        public static final String FORGOT_PASSWORD = "/views/forgot-password.jsp";
        public static final String RESET_PASSWORD = "/views/reset-password.jsp";
        public static final String CATEGORY_LIST = "/views/admin/list-category.jsp";
        public static final String CATEGORY_ADD = "/views/admin/add-category.jsp";
        public static final String CATEGORY_EDIT = "/views/admin/edit-category.jsp";
        public static final String PRODUCT_LIST = "/views/admin/list-product.jsp";
        public static final String PRODUCT_ADD = "/views/admin/add-product.jsp";
        public static final String PRODUCT_EDIT = "/views/admin/edit-product.jsp";
    }
}
