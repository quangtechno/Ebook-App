package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO{
private Connection con;
public CartDAOImpl(Connection con) {
	this.con=con;
}
	@Override
	public boolean addCart(Cart c) {
	boolean condition=false;
	try {
		String query="insert into cart(bid,uid,bookName,author,price,totalPrice) values(?,?,?,?,?,?);";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, c.getBid());
		ps.setInt(2, c.getUserId());
		ps.setString(3, c.getBookName());
		ps.setString(4, c.getAuthor());
		ps.setDouble(5, c.getPrice());
		ps.setDouble(6, c.getTotalPrice());
	 int row=ps.executeUpdate();
	 if(row==1) {
		 condition=true;
	 }
	}catch(Exception e) {
		e.printStackTrace();
	}
	return condition;
	}
	@Override
	public List<Cart> getBookByUserId(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		double totalPrice=0;
		Cart c=null;
		try {
			String query="select * from cart where uid=?;";
			PreparedStatement ps =con.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice+=rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean condition=false;
	try {
		String query="delete from cart where bid=? and uid=?;";
		PreparedStatement ps=con.prepareStatement(query);	
		ps.setInt(1, bid);
		ps.setInt(2, uid);
		int row=ps.executeUpdate();
		if(row==1) {
			condition=true;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return condition;
	}

}