package com.filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.mysql.cj.Session;

public class AuthorizationFilter implements Filter {
 private ServletContext context;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context=filterConfig.getServletContext();
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException,ServletException{
		HttpSession session=((HttpServletRequest) servletRequest).getSession();
		HttpServletRequest request= (HttpServletRequest) servletRequest;
		HttpServletResponse response= (HttpServletResponse) servletResponse;
        String url= request.getRequestURI();
        System.out.println(url);
		if(url.startsWith("/Ebook-App/admin")) {
			System.out.println("check now"+url);
		User user=(User) session.getAttribute("userObj");
			if(user!=null) {
				if(!user.getEmail().equalsIgnoreCase("admin@gmail.com")){
					response.sendRedirect("../forbidden.jsp");
				}else {
					chain.doFilter(servletRequest, servletResponse);
				}
			}else {
				response.sendRedirect("../login.jsp");
			}
		}else {
			
			chain.doFilter(servletRequest, servletResponse);
		}
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
