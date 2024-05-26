package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println("deleting "+id);
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
			boolean condition=dao.deleteBooks(id);
			HttpSession session=req.getSession();
			if(condition) {
				session.setAttribute("succMsg", "Book Update Successfully");
			}else {
				session.setAttribute("failedMsg", "some thing is wrong");
			}
			resp.sendRedirect("admin/all_books.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
	}

	

}
