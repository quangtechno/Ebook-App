package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   req.setCharacterEncoding("UTF-8");
	        resp.setContentType("text/html; charset=UTF-8");
	        resp.setCharacterEncoding("UTF-8");
		int cid=Integer.parseInt(req.getParameter("cid"));
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getCon());
		boolean condition=dao.deleteBook(bid, uid, cid);
		HttpSession session=req.getSession();
		
		if(condition) {
			  req.setAttribute("toastType", "Success");
              req.setAttribute("toastMessage", "removed Successfully");
		}else {
			  req.setAttribute("toastType", "Error");
              req.setAttribute("toastMessage", "cant not remove To Cart");
		}
        RequestDispatcher dispatcher = req.getRequestDispatcher("checkout.jsp");
        dispatcher.forward(req, resp);
	}

}
