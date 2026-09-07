package vn.iotstar.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.iotstar.model.Category;
import vn.iotstar.model.Product;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.ProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/product")
public class ProductPageController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        try {
            String pageParam = req.getParameter("page");
            if (pageParam != null) {
                page = Integer.parseInt(pageParam.trim());
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        if (page < 1) {
            page = 1;
        }

        Integer cateId = null;
        Category category = null;
        try {
            String cateIdParam = req.getParameter("cateId");
            if (cateIdParam != null && !cateIdParam.isEmpty()) {
                cateId = Integer.parseInt(cateIdParam.trim());
                category = categoryService.get(cateId);
                if (category == null) {
                    cateId = null;
                }
            }
        } catch (NumberFormatException e) {
            cateId = null;
        }

        int pageSize = Constant.PRODUCT_PAGE_SIZE;
        List<Product> productList;
        int totalPages;

        if (cateId != null) {
            totalPages = productService.countTotalPagesByCategory(pageSize, cateId);
            if (totalPages > 0 && page > totalPages) {
                page = totalPages;
            }
            productList = productService.getPageByCategory(page, pageSize, cateId);
        } else {
            totalPages = productService.countTotalPages(pageSize);
            if (totalPages > 0 && page > totalPages) {
                page = totalPages;
            }
            productList = productService.getPage(page, pageSize);
        }

        req.setAttribute("productList", productList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("category", category);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/product.jsp");
        dispatcher.forward(req, resp);
    }
}
