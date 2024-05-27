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
			if (checkExist(us)) {

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

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setCity(rs.getString(7));
				user.setState(rs.getString(8));
				user.setZip(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean condition = false;
		try {
			String query = "select * from user where id=? and password=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			pst.setString(2, ps);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				condition=true;	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condition;
	}

	@Override
	public boolean updateProfiles(User user) {
		boolean condition = false;
		try {
			String query = "update user set name= ?,email= ?,phone= ?where id = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setInt(4, user.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				condition = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condition;
	}

}
