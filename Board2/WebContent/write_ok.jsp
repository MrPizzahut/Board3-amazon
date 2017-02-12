<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%
	request.setCharacterEncoding("utf-8");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "system";
	String pass = "1234";
	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pass);
		String sql = "insert into board(num, username, password, title, content) values(seq_num.nextval,?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, name);
		ps.setString(2, password);
		ps.setString(3, title);
		ps.setString(4, memo);
		
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%> 

<script language = "javaScript">
	self.window.alert("The writing is uploaded.");
	location.href = "list.jsp";
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>