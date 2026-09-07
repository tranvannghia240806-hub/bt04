package vn.iotstar.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.Constant;
import vn.iotstar.util.ImageUploadHelper;

@WebServlet(urlPatterns = { "/admin/product/edit" })
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            return;
        }
        Product product = productService.get(id);
        if (product == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            return;
        }
        req.setAttribute("product", product);
        req.setAttribute("cateList", categoryService.getAll());
        RequestDispatcher dispatcher = req.getRequestDispatcher(Constant.Path.PRODUCT_EDIT);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        servletFileUpload.setHeaderEncoding("UTF-8");
        try {
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");

            int id = 0, cateId = 0, quantity = 0;
            String name = null, description = null, image = null;
            BigDecimal price = BigDecimal.ZERO;

            List<FileItem> items = servletFileUpload.parseRequest(req);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    switch (item.getFieldName()) {
                        case "id":
                            id = Integer.parseInt(item.getString("UTF-8").trim());
                            break;
                        case "name":
                            name = item.getString("UTF-8");
                            break;
                        case "price":
                            price = new BigDecimal(item.getString("UTF-8").trim());
                            break;
                        case "description":
                            description = item.getString("UTF-8");
                            break;
                        case "quantity":
                            quantity = Integer.parseInt(item.getString("UTF-8").trim());
                            break;
                        case "cateId":
                            cateId = Integer.parseInt(item.getString("UTF-8").trim());
                            break;
                    }
                } else if ("image".equals(item.getFieldName())) {
                    image = ImageUploadHelper.save(item, "product", "shopping/product");
                }
            }

            Category category = categoryService.get(cateId);
            Product product = new Product(name, price, description, image, quantity, null, category);
            product.setId(id);
            productService.edit(product);
            resp.sendRedirect(req.getContextPath() + "/admin/product/list");
        } catch (FileUploadException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?error=upload");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/product/list?error=upload");
        }
    }
}
