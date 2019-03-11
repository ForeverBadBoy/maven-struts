<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/view/base.jsp" %>
<!-- 貌似struts2中必须使用这个版本的C标签 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>user_success</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is user_success page. <br/><br/>
          用户名:${requestScope.user.userName }
    <h1><crt:out value="${sessionScope.loginUserName }"></crt:out></h1>
    <br/><br/>
    <a href="${pageContext.request.contextPath }/user/userAction_logout.action">
    	<span>注销</span>
    </a><br/><br/>
    <s:fielderror></s:fielderror>
   </body>
</html>
