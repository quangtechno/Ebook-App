package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			BookDtls b = dao.getBookById(bid);
          Cart c=new Cart();
          c.setBid(bid);
          c.setUserId(uid);
          c.setBookName(b.getBookname());
          c.setAuthor(b.getAuthor());
          c.setPrice(b.getPrice());
          c.setTotalPrice(b.getPrice());
          CartDAOImpl dao2=new CartDAOImpl(DBConnect.getCon());
          boolean condition=dao2.addCart(c);
          if(condition) {
        	  req.setAttribute("toastType", "Success");
              req.setAttribute("toastMessage", "Add cart Successfully");
              System.out.println("must add");
          
          }else{
        	  req.setAttribute("toastType", "Error");
              req.setAttribute("toastMessage", "Not Added To Cart");
              System.out.println("must add");
          }
          RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
          dispatcher.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
