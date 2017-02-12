<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%	

request.setCharacterEncoding("utf-8");

Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id = "system";
String pass = "1234";

String password =request.getParameter("password");
String passworddb="";
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
			
			String sql = "delete from board where num=" + num;
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.executeUpdate();
			ps.close();
			rs.close();
			stmt.close();
			conn.close();
			%>
			<script language = "javaScript">
			self.window.alert("deletion completed");
			window.opener.location.href = "list.jsp";
			window.close();
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