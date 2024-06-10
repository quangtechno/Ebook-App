package com.admin.servlet;

import java.io.IOException;

import javax.annotation.security.DeclareRoles;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
@DeclareRoles({"ADMIN"})
@WebServlet("/editBooks")

public class BooksEdit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Thiết lập mã hóa ký tự cho request và response
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            // Lấy các tham số từ form
            int id = Integer.parseInt(req.getParameter("id"));
            String bname = req.getParameter("bName");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("bstatus");

            // Tạo đối tượng BookDtls và thiết lập các giá trị
            BookDtls b = new BookDtls();
            b.setBookId(id);
            b.setBookname(bname);
            b.setAuthor(author);
            b.setPrice(Double.parseDouble(price));
            b.setStatus(status);

            // Thực hiện cập nhật sách trong cơ sở dữ liệu
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
            boolean condition = dao.editBooks(b);

            // In ra thông tin sách để kiểm tra
            System.out.println(b.toString());

            // Thiết lập thông báo và chuyển hướng
            HttpSession session = req.getSession();
            if (condition) {
                session.setAttribute("succMsg", "Book Update Successfully");
            } else {
                session.setAttribute("failedMsg", "Something is wrong");
            }
            resp.sendRedirect("admin/all_books.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
