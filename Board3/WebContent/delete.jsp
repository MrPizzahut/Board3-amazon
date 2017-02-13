<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
%>	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	</head>
	<body>	
	
	  <h2>Input the password</h2>
    <form method="post" action="delete_ok.jsp?num=<%=num%>" >   
Password: <input type="password" name="password" maxlength="16"
           style="ime-mode:inactive;"><br>
     <input type="submit" value="delete" >
</form>



</body>
</html>