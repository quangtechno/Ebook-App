package com.DB;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class DBConnect {
 private static Connection con;
 public static Connection getCon() {
	 try {
		 Class.forName("com.mysql.cj.jdbc.Driver");
	 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app", "root", "mysql");
		System.out.println(con);
	} catch (Exception e) {
		System.out.println("error here");
		e.printStackTrace();
	}
	return con;
}
}
