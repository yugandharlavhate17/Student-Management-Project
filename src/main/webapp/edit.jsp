<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jspproject.studentregistration.DBConnec"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Section</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%! private String selectQuery = "SELECT name,rollno,email,dept,city FROM student_info WHERE sr_no=?"; %>
<h1 style="margin-left:44%;">This is edit page</h1>

<div class="container">
<h2>Edit the details of <%=request.getParameter("id") %></h2>
<%
try {
	Connection con = DBConnec.getConnection();
	
	PreparedStatement ps = con.prepareStatement(selectQuery);
	int newid = Integer.parseInt(request.getParameter("id"));
	ps.setInt(1, newid);
	ResultSet rs = ps.executeQuery();
	
	rs.next();
	
%>


<form action="update" method="POST">
<table>
<tr>
<td><label for="fullName">Name : </label></td>
<td><input type="text" id="fullName" name="fullName" value="<%= rs.getString(1) %>" required="required"></td>
</tr>

<tr>
<td><label for="rollNo">Roll No : </label></td>
<td><input type="text" id="rollNo" name="rollNo" value="<%=rs.getInt(2) %>" required="required"></td>
</tr>

<tr>
<td><label for="email">Email : </label></td>
<td><input type="email" id="email" name="email" value="<%=rs.getString(3) %>" required="required"></td>
</tr>

<tr>
<td><label for="dept">Department : </label></td>
<td><input type="text" id="dept" name="dept" value="<%=rs.getString(4) %>"  required="required"></td>
</tr>

<tr>
<td><label for="city">City : </label></td>
<td><input type="text" id="city" name="city" value="<%= rs.getString(5) %>" required="required"></td>
</tr>

<tr>
<td><input id="submitBtn" type="submit" value="Update"> </td>
<td><input id="resetBtn" type="reset" value="Reset"></td>
</tr>
</table>
</form>
</div>


<%
}
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