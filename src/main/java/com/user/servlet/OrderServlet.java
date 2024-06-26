package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.security.DeclareRoles;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import com.entity.User;

@WebServlet("/order")
@DeclareRoles({"USER"})
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			//user id
			int id = Integer.parseInt(req.getParameter("id"));
			HttpSession session=req.getSession();
			String name = req.getParameter("uName");
			String email = req.getParameter("uEmail");
			String phone = req.getParameter("uPhone");
			String address = req.getParameter("uAddress");
			String password=req.getParameter("uPassword");
			String city = req.getParameter("uCity");
			String province = req.getParameter("uProvince");
			String paymentMethod = req.getParameter("uSelect");
			String pincode = req.getParameter("uPin");
			String fulladd = address + "," + city + "," + province + "," + pincode;
			//System.out.println(fulladd);
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
			UserDAOImpl daoUser=new UserDAOImpl(DBConnect.getCon());
			System.out.println(email+" "+password);
			//User temp=daoUser.login(email, password);
			User temp=(User) session.getAttribute("userObj");

			temp.setAddress(address);
			temp.setCity(city);
			temp.setProvince(province);
			temp.setZip(pincode);
			daoUser.updateProfilesOrder(temp);
			System.out.println(temp.toString());
			
			
			
//			dao.getBookByUserId(0);
			List<Cart> blist = dao.getBookByUserId(id);

			if(blist.isEmpty()) {
				resp.sendRedirect("checkout.jsp");
			}else {
				Book_Order o=null;
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getCon());
				int i = dao2.getOrderNo();
				for (Cart c : blist) {
					o = new Book_Order();
					o.setOrder_Id("BOOK-ORD-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFulladd(fulladd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(String.valueOf(c.getPrice()));
					o.setPaymentMethod(paymentMethod);
					 System.out.println(o.toString());
					orderList.add(o);
					i++;
				}
				dao.deleteCart(id);
				
				boolean condition = dao2.saveOrder(orderList);
				if(condition) {
		        	  session.setAttribute("toastType", "Success");
		        	  session.setAttribute("toastMessage", "Order Successfully");
		        	  resp.sendRedirect("checkout.jsp");
		    
		          }else{
		        	  session.setAttribute("toastType", "Error");
		        	  session.setAttribute("toastMessage", "Error");
		        	  resp.sendRedirect("checkout.jsp");
		          }
				
				
			}
		
		} catch (Exception e) {
          e.printStackTrace();
		}
	}

}
