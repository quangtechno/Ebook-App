package com.user.servlet;

import java.io.IOException;

import javax.annotation.security.DeclareRoles;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
@DeclareRoles({"USER"})
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String Checkpassword = req.getParameter("Checkpassword");
			String check=req.getParameter("check");
			System.out.println(name + " " + email + " " + phone + " " + password + " " + Checkpassword);
			if (Checkpassword.equals(password)) {
				User user = new User();
				user.setName(name);
				user.setEmail(email);
				user.setPhone(phone);
				user.setPassword(Checkpassword);
				UserDAOImpl daoImpl=new UserDAOImpl(DBConnect.getCon());
			boolean test =daoImpl.userRegister(user);
			if(check!=null) {
			if(test) {
				req.setAttribute("thongbaotc", "Registration complete");
				req.setAttribute("thongbaoer", "");
			}else {
				req.setAttribute("thongbaoer", "Registration Error");
				req.setAttribute("thongbaotc", "");
			}
			}else {
				req.setAttribute("thongbaoer", "Please agree terms & condition");
				req.setAttribute("thongbaotc", "");
			}
				System.out.println("complete");
			}else {
				req.setAttribute("thongbaoer", "Passwords do not match");
				req.setAttribute("thongbaotc", "");
			}
              
		} catch (Exception e) {

			e.printStackTrace();
		}
		doGet(req, resp);
}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd= req.getServletContext().getRequestDispatcher("/register.jsp");
		rd.forward(req, resp);
	}

}
