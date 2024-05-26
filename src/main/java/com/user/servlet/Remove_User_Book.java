package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;

import com.DB.DBConnect;

@WebServlet("/remove_user_book")
public class Remove_User_Book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String email = req.getParameter("email");
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
		boolean condition = dao.deleteByEmail(email);
		HttpSession session = req.getSession();
		if (condition) {
			session.setAttribute("succMsg", "Book removed from Cart");
			resp.sendRedirect("all_book_user.jsp");
		} else {
			session.setAttribute("failedMsg", "some thing wrong on servet");
			resp.sendRedirect("all_book_user.jsp");
		}
	}

}