<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jspproject.studentregistration.DBConnec"%>
<%@page import="java.sql.Connection,java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Status</title>
<link rel="stylesheet" href="css/register.css?v=1">
</head>
<body>
<h2>Registration status : </h2>
<%!
private String insertQuery = "INSERT INTO student_info(name,rollno,email,dept,city) VALUES(?,?,?,?,?)";
%>
<%
//Getting student information
String name = request.getParameter("fullName");
int rollNo = Integer.parseInt(request.getParameter("rollNo"));
String email = request.getParameter("email");
String dept = request.getParameter("dept");
String city = request.getParameter("city");
%>

<%
//Getting db connection
try {
	Connection con = DBConnec.getConnection();
	
	PreparedStatement ps = con.prepareStatement(insertQuery);
	ps.setString(1, name);
	ps.setInt(2, rollNo);
	ps.setString(3, email);
	ps.setString(4, dept);
	ps.setString(5, city);
	
	//Submitting SQL QUERY
	int rowCount = ps.executeUpdate();
	if(rowCount > 0) {
// 		request.getRequestDispatcher("index.jsp").include(request, response); Optional way to show on same page
		out.println("<h3 id='registerstatus'><i class='fa fa-check'></i>Registration Done Successfully!!</h3>");
		out.println("<a href='index.jsp' >Go to home page</a>");
	}
	else {
		out.println("<h3 id='error-msg'>Registration Not Done!!</h3>");
	}
}
catch(ClassNotFoundException e) {
	e.printStackTrace();
}
catch(SQLException e) {
	e.printStackTrace();
	out.println("<h4>" + e.getMessage() + "</h4>");
}
catch(Exception e) {
	e.printStackTrace();
	out.println("<h4>" + e.getMessage() + "</h4>");
}
%>
</body>
</html>