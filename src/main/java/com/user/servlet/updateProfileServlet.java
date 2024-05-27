package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class updateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");

			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhone(phone);
			user.setPassword(password);
				HttpSession session=req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());
			boolean condition = dao.checkPassword(id , password);
			System.out.println(condition);
			System.out.println(user.toString());
			if (condition) {
				boolean condition2=dao.updateProfiles(user);
				if(condition2) {
					session.setAttribute("succMsg","Profile Update Successfully");
					session.setAttribute("userObj", user);
				}else {
					session.setAttribute("faildedMsg","Something Wrong On Server");
					
				}
			} else {
				session.setAttribute("faildedMsg","Some thing is Wrong");
			}
			resp.sendRedirect("edit_profile.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
