<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jspproject.studentregistration.DBConnec"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students List</title>
<link rel="stylesheet" href="css/showlist.css">
</head>
<body>
<%!
	private String selectQuery = "SELECT sr_no,name,rollno,email,dept,city FROM student_info";
%>

<%
try {
	Connection con = DBConnec.getConnection();
	
	PreparedStatement ps = con.prepareStatement(selectQuery);
	
	ResultSet rs = ps.executeQuery();
	%>
	<h2>Students List</h2>
	
	<table class="listTable">
	<thead>
	<tr>
	<th>Name</th>
	<th>Roll No</th>
	<th>Email</th>
	<th>Department</th>
	<th>City</th>
	<th style="text-align: center;">Action</th>
	<th></th>
	</tr>
	</thead>
	
	<tbody>
	<%while(rs.next()) { %>
		<tr>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getInt(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><a href="edit.jsp?id=<%=rs.getInt(1) %>">Edit</a></td>
		<td><a href="delete.jsp?id=<%=rs.getInt(1) %>">Delete</a></td>
		</tr>
		
	<%}//end-while %>
	</tbody>
	</table>
	
	<% 
}//end try
catch(ClassNotFoundException e) {
	e.printStackTrace();
	out.println("<h4>" + e.getMessage() + "</h4>");
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