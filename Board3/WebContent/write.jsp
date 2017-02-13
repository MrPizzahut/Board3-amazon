<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script language = "javascript">
			function writeCheck(){
			    if(!document.frm.title.value){
					alert("Input title");
					document.frm.title.focus();
					return;
			    }
			    
			    if(!document.frm.name.value){
					alert("Input writer");
					document.frm.name.focus();
					return;
		    	}
			    
			    if(!document.frm.password.value){
					alert("Input password");
					document.frm.password.focus();
					return;
		    	}
			    
			    if(!document.frm.memo.value){
					alert("Input contents");
					document.frm.memo.focus();
					return;
		    	}
			    
			    document.frm.submit();
			}
		</script>
	</head>
<body>
<table>
	<form name = "frm" method = "post" action = "write_ok.jsp">
		  <tr>
		   <td>
		    <table width="650" cellpadding="0" cellspacing="0" border="0">
		     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
		      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
		      <td>write</td>
		      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
		     </tr>
		    </table>
		   <table>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">title</td>
		      <td><input name="title" size="50" maxlength="100"></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		    <tr>
		      <td>&nbsp;</td>
		      <td align="center">writer</td>
		      <td><input name="name" size="50" maxlength="50"></td>
		      <td>&nbsp;</td>
		     </tr>
		      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		    <tr>
		      <td>&nbsp;</td>
		      <td align="center">password</td>
		      <td><input name="password" size="50" maxlength="50"></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr>
		      <td>&nbsp;</td>
		      <td align="center">contents</td>
		      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
		      <td>&nbsp;</td>
		     </tr>
		     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		     <tr align="center">
		      <td>&nbsp;</td>
		      <td colspan="2"><input type = "button" value="registraion" onClick="javascript:writeCheck();">
		       <input type="button" value="cancel" onClick = "javascript:history.back(-1)">
		      <td>&nbsp;</td>
		     </tr>
		    </table>
		   </td>
		  </tr>
		  </form>
	 </table>
</body>
</html>