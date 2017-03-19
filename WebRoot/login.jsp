<%@ page language="java" import="java.util.*,java.sql.*,SQLHelper.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
     <%
  String UID = request.getParameter("UID");
  String pwd = request.getParameter("pwd");
  SqlHelper sql = new SqlHelper();
  ResultSet resuser= sql.QueryUser(UID, pwd);
  if(resuser.next()){
  	if(resuser.getInt(5)==1){
  		//跳转到前端销售
  		response.sendRedirect("sold.jsp");
  		session.setAttribute("sold",resuser.getString(1));
  	}
  	else{
  		//跳转到后台管理
  		response.sendRedirect("goods.jsp");
  		session.setAttribute("manager",resuser.getString(1));
  		}
  }
  else	{
		%>
		<script type="text/javascript">alert('用户名或者密码不正确！！');
		window.location.href='index.jsp';
		</script>
		<%
  }
   %> 
  </body>
</html>
