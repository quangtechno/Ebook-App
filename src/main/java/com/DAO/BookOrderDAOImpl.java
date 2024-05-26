package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderDAOImpl implements BookOrderDAO{
private Connection con;
public BookOrderDAOImpl(Connection con) {
	super();
	this.con=con;
}
@Override
public int getOrderNo() {
	int i=0;
	try {
		String query="select * from book_order";
		PreparedStatement ps=con.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			i++;
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return i;
}
@Override
public boolean saveOrder(List<Book_Order> blist) {
	boolean condition=false;
	try {
		String query="insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?);";
		con.setAutoCommit(false);
		PreparedStatement ps=con.prepareStatement(query);
		for(Book_Order b : blist) {
			ps.setString(1,b.getOrder_Id());
			ps.setString(2,b.getUserName());
			ps.setString(3,b.getEmail());
			ps.setString(4,b.getFulladd());
			ps.setString(5,b.getPhone());
			ps.setString(6,b.getBookName());
			ps.setString(7,b.getAuthor());
			ps.setString(8,b.getPrice());
			ps.setString(9,b.getPaymentMethod());
			ps.addBatch();
		}
		
		int[]count=ps.executeBatch();
		con.commit();
		condition=true;
		con.setAutoCommit(true);
	}catch(Exception e) {
		e.printStackTrace();
	}
	return condition;
}
@Override
public List<Book_Order> getBook(String email) {
	List<Book_Order> list=new ArrayList<Book_Order>();
	Book_Order o=null;
	try {
		String query="select * from book_order where email=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1,email);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			o=new Book_Order();
			o.setId(rs.getInt(1));
			o.setOrder_Id(rs.getString(2));
			o.setUserName(rs.getString(3));
			o.setEmail(rs.getString(4));
			o.setFulladd(rs.getString(5));
			o.setPhone(rs.getString(6));
			o.setBookName(rs.getString(7));
			o.setAuthor(rs.getString(8));
			o.setPrice(rs.getString(9));
			o.setPaymentMethod(rs.getString(10));
			list.add(o);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}
@Override
public List<Book_Order> getBook() {
	List<Book_Order> list=new ArrayList<Book_Order>();
	Book_Order o=null;
	try {
		String query="select * from book_order";
		PreparedStatement ps=con.prepareStatement(query);
	
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			o=new Book_Order();
			o.setId(rs.getInt(1));
			o.setOrder_Id(rs.getString(2));
			o.setUserName(rs.getString(3));
			o.setEmail(rs.getString(4));
			o.setFulladd(rs.getString(5));
			o.setPhone(rs.getString(6));
			o.setBookName(rs.getString(7));
			o.setAuthor(rs.getString(8));
			o.setPrice(rs.getString(9));
			o.setPaymentMethod(rs.getString(10));
			list.add(o);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}
}
