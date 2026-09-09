package vn.iotstar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import vn.iotstar.util.Constant;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = req.getParameter("fname");
        if (fileName == null || fileName.isEmpty()) {
            return;
        }

        resp.setContentType(getContentType(fileName));

        File runtimeFile = new File(Constant.DIR + "/" + fileName);
        if (runtimeFile.exists()) {
            try (FileInputStream fis = new FileInputStream(runtimeFile)) {
                IOUtils.copy(fis, resp.getOutputStream());
            }
            return;
        }

        String bundledPath = "/assets/uploads/" + fileName;
        try (InputStream bundledStream = getServletContext().getResourceAsStream(bundledPath)) {
            if (bundledStream != null) {
                IOUtils.copy(bundledStream, resp.getOutputStream());
            }
        }
    }

    private String getContentType(String fileName) {
        String lower = fileName.toLowerCase();
        if (lower.endsWith(".png")) return "image/png";
        if (lower.endsWith(".gif")) return "image/gif";
        if (lower.endsWith(".webp")) return "image/webp";
        return "image/jpeg";
    }
}
