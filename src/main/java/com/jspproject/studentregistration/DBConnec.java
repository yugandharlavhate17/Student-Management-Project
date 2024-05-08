package com.jspproject.studentregistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnec {
	static String dbDriver = "com.mysql.cj.jdbc.Driver";
	static String dbURL = "jdbc:mysql://localhost:3306/";
	
	
	//Database name to access
	static String dbName = "studentdb";
	static String dbUsername = "root";
	static String dbPassword = "root";	
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException 
	{
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
		return con;
	}
}
