<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@orcl.ctsaq7jylp2v.ap-northeast-1.rds.amazonaws.com:1521:orcl";
	String id = "root";
	String pass = "-----------";
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "select username, title, content, hit, reg_date from board where num=" + num;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			String name = rs.getString("username");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String reg_date = rs.getString("reg_date");
			int hit = rs.getInt("hit");
			hit++;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script>
		function delete1(num){
		wx=300;
		wy=200;
		sx=screen.width;
		sy=screen.height;
		x=(sx-wx)/2;
		y=(sy-wy)/2;
		
		url="delete.jsp?num="+num;
		wr=window.open(url,"checking id","width=300,height=200");
		wr.moveTo(x,y);

	} 
	</script>	
	</head>
	<body>
		<table>
			<tr>
				<td>
					<table width = "650" cellpadding = "0" cellspacing = "0" border = "0">
						<tr style = "background:url('img/table_mid.gif') repeat-x; text-align:center;">
							<td width = "5">
								<img src = "img/table_left.gif" width = "5" height = "30"/>
							</td>
							<td>view</td>
							<td width = "5">
								<img src = "img/table_right.gif" width = "5" height = "30"/>
							</td>
						</tr>
					</table>
					<table width = "650">
						<tr>
							<td width = "0">&nbsp;</td>
							<td align = "center" width = "80">post number</td>
							<td width = "320"><%=num %></td>
							<td width = "0">&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"/>
						</tr>
						<tr>
							<td width = "0">&nbsp;</td>
							<td align = "center" width = "80">count number</td>
							<td width = "320"><%=hit %></td>
							<td width = "0">&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"/>
						</tr>
						<tr>
							<td width = "0">&nbsp;</td>
							<td align = "center" width = "80">writer</td>
							<td width = "320"><%=name %></td>
							<td width = "0">&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"/>
						</tr>
						<tr>
							<td width = "0">&nbsp;</td>
							<td align = "center" width = "80">date</td>
							<td width = "320"><%=reg_date %></td>
							<td width = "0">&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"/>
						</tr>
						<tr>
							<td width = "0">&nbsp;</td>
							<td align = "center" width = "80">title</td>
							<td width = "320"><%=title %></td>
							<td width = "0">&nbsp;</td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"/>
						</tr>
						<tr>
							<td width = "0">&nbsp;</td>
							<td width = "400" colspan = "2" height = "200"><%=content %></td>
						</tr>
<%
			sql = "update board set hit=" + hit + " where num=" + num;
			stmt.executeUpdate(sql);
							
			rs.close();
			stmt.close();
			conn.close();
		}
	}catch(SQLException e){}
%>
						<tr height = "1" bgcolor = "#dddddd">
							<td colspan = "4" width = "407"></td>
						</tr>
						<tr height = "1" bgcolor = "#82B5DF">
							<td colspan = "4" width = "407"></td>
						</tr>
						<tr align = "center">
							<td width = "0">&nbsp;</td>
							<td colspan = "2" width = "400">
								<input type = "button" value = "write" onClick = "location.href = 'write.jsp'"/>
								<input type = "button" value = "list" onClick = "location.href = 'list.jsp'"/>
								<input type = "button" value = "edit" onClick = "javascript:window.location='update.jsp?num=<%=num %>'"/>
								<input type = "button" value = "delete" onClick = "delete1('<%=num %>')"/>								
							</td>
							<td width = "0">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>	
	</body>
</html>
