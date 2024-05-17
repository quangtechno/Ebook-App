package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import com.entity.User;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.PreparableStatement;

public class UserDAOImpl implements UserDAO {
	private Connection con;

	@Override
	public boolean userRegister(User us) {
		boolean condition = false;
		try {
			if(checkExist(us)) {
				
				return false;
			}
			
			String query = "insert into user(name,email,phone,password)" + "values(?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				condition = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condition;
	}

	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean checkExist(User us) {
	    boolean condition = false;
	    try {
	        String query = "SELECT * FROM user WHERE email = ? AND password = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, us.getEmail());
	        ps.setString(2, us.getPassword());

	        ResultSet rs = ps.executeQuery();
	        
	        int rowCount = 0;
	        while (rs.next()) {
	            rowCount++;
	        }

	        System.out.println("Row count: " + rowCount);

	        if (rowCount > 0) {
	            System.out.println("User exists");
	            condition = true;
	        } else {
	            System.out.println("User does not exist");
	            condition = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return condition;
	}


}
