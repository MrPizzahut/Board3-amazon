<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>board2</title>
	</head>
	<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@orcl.ctsaq7jylp2v.ap-northeast-1.rds.amazonaws.com:1521:orcl";
		String id = "root";
		String pass = "19871982";
		int total = 0;
		
		try{
			Connection conn = DriverManager.getConnection(url, id, pass);
			Statement stmt = conn.createStatement();
			String sql = "select count(*) from board";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			rs.close();
			out.print("total post : " + total + " .");
			
			sql = "select num,title,username, reg_date, hit from board order by num desc";
			rs = stmt.executeQuery(sql);		
	%>
		<table width = "650" cellpadding = "0" cellspacing = "0" border = "0">
			<tr height = "5"><td width = "5"></td></tr>
			<tr style = "background:url('img/table_mid.gif') repeat-x; text-align:center;">
				<td width = "5"><img src = "img/table_left.gif" width = "5" height = "30"/></td>
				<td width = "40">number</td>
				<td width = "400">title</td>
				<td width = "70">writer</td>
				<td width = "70">date</td>
				<td width = "60">count</td>
				<td width = "7"><img src = "img/table_right.gif" width = "5" height = "30"/></td>
			</tr>
			<%
				if(total == 0){
			%>
				<tr align = "center" bgcolor = "#FFFFFF" height = "30">
					<td colspan = "6">There is no post.</td>
				</tr>	
			<%}else{ 
				
				while(rs.next()){
					int num = rs.getInt("num");
					String name = rs.getString("username");
					String title = rs.getString("title");
					String reg_date = rs.getString("reg_date");
					int hit = rs.getInt("hit");			
			%>		
			<tr height = "25" align = "center">
				<td>&nbsp;</td>
				<td><%=num %></td>
				<td align = "left"><a href = "view.jsp?num=<%=num %>"> <%=title %></a></td>
				<td align = "center"><%=name %></td>
				<td align = "center"><%=reg_date %></td>
				<td align = "center"><%=hit %></td>
				<td>&nbsp;</td>
			</tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<%
				}
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException e){
			out.println(e.toString());
		}
			%>
			<tr height = "1" bgcolor = "#82B5DF"><td colspan = "6" width = "752"></td></tr>
		</table>
		<table width = "650" cellpadding = "0" cellspacing = "0" border = "0">
			<tr><td colspan = "4" height = "5"></td></tr>
			<tr align = "center">
				<td><input type = "button" value = "write" Onclick = "location.href = 'write.jsp'"></td>
			</tr>
		</table>
	</body>
</html>