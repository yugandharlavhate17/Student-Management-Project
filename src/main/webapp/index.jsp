<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<link rel="stylesheet" type="text/css" href="style.css?v=1">
</head>
<body>
<div class="container">
<h2>Registration Form</h2>

<form action="register" method="POST">
<table>
<tr>
<td><label for="fullName">Name : </label></td>
<td><input type="text" id="fullName" name="fullName" required="required"></td>
</tr>

<tr>
<td><label for="rollNo">Roll No : </label></td>
<td><input type="text" id="rollNo" name="rollNo" required="required"></td>
</tr>

<tr>
<td><label for="email">Email : </label></td>
<td><input type="email" id="email" name="email" required="required"></td>
</tr>

<tr>
<td><label for="dept">Department : </label></td>
<td><input type="text" id="dept" name="dept" required="required"></td>
</tr>

<tr>
<td><label for="city">City : </label></td>
<td><input type="text" id="city" name="city" required="required"></td>
</tr>

<tr>
<td><input id="submitBtn" type="submit" value="Register"> </td>
<td><a href="showStudents">Show List</a></td>
<td><input id="resetBtn" type="reset" value="Reset"></td>
</tr>
</table>
</form>
</div>
</body>
</html>