<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jspproject.studentregistration.DBConnec"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
private String deleteQuery = "DELETE FROM student_info WHERE sr_no=?";
%>

<%
try {
	Connection con = DBConnec.getConnection();
	
	PreparedStatement ps = con.prepareStatement(deleteQuery);
	int newid = Integer.parseInt(request.getParameter("id"));
	ps.setInt(1, newid);

	int rows = ps.executeUpdate();
	if(rows > 0) {
		%>		
		<h2 style="color:red;">Record deleted sucessfully</h2>
<%
		RequestDispatcher rd = request.getRequestDispatcher("ShowStudents.jsp");
		rd.include(request, response);
	}
	else {
		out.println("Error Occured!");
	}



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