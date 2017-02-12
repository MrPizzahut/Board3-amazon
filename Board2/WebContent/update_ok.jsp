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
	String passworddb="";
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int num = Integer.parseInt(request.getParameter("num"));
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pass);
		
		String sql2 = "select password from board where num=" + num;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql2);
		if(rs.next()){
			passworddb = rs.getString("password");
		}
		if(passworddb.equals(password)){
			
			String sql = "update board set username = ?, title = ?, content = ? where num=" + num;
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, memo);
			ps.executeUpdate();
			
			ps.close();
			rs.close();
			stmt.close();
			conn.close();
			%>
			<script language = "javaScript">
			self.window.alert("The writing is uploaded.");
			location.href = "list.jsp";
			</script>
			<%
		}else{
			%>
			<script> 
			  alert("Password is not correct.");
		      history.go(-1);
			</script>
			<%
		}
	}catch(SQLException e){
		out.println(e.toString());
	}
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>