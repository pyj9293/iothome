package com.iothome.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public DBConnect() {}
	
	public Connection getConnection() {
		String url = "jdbc:mariadb://121.187.77.42:3306/IOTHOME";
		String id = "root";
		String pass = "jsea2017";
		
		Connection con = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pass);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
			System.out.println("DB Error ");
		}
		return con;
	}
}
