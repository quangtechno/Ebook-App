package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.annotation.security.DeclareRoles;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books_user")
@DeclareRoles({"USER"})
@MultipartConfig
public class AddBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
			String bookname=req.getParameter("bName");
			
			String author=req.getParameter("author");
			double price=Double.parseDouble(req.getParameter("price"));
			String category=req.getParameter("btype");
			String status=req.getParameter("bstatus");
			Part part=req.getPart("bimg");
			String email=req.getParameter("uEmail");
			String filename =  part.getSubmittedFileName();
			BookDtls b=new BookDtls(bookname, author, price, category, status, filename, email);
			System.out.println(b.toString());
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
			String path="D:\\java\\eclipse_source\\Ebook-App\\src\\main\\webapp\\image";
			File file=new File(path);
			part.write(path+File.separator+filename);
			//System.out.println(path);
			//System.out.println(b.toString());
			boolean f=dao.addBooks(b);
			HttpSession session=req.getSession();
			
			 if(f) {
				 session.setAttribute("succMsg",	"Book Add Successfully");
				 resp.sendRedirect("sell_book.jsp");
			 }else {
				 session.setAttribute("failedMsg",	"SomeThing Wrong On Server");
				 resp.sendRedirect("sell_book.jsp");
			 }
			 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
