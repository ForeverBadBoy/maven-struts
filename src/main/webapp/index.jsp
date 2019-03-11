<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="cn.com.kid.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <%@ include file="/view/base.jsp" %>
    <base href="<%=basePath%>">
    
    <title>index</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript">
 	/*
 	在网络延迟的情况下让用户有时间点击多次submit按钮导致表单重复提交
 	用JavaScript控制Form表单只能提交一次
 	*/
 	var isCommitted = false;//表单是否已经提交标识，默认为false
    function dosubmit(){
       if(isCommitted==false){
            isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
            return true;//返回true让表单正常提交
       }else{
            return false;//返回false那么表单将不提交
       }
 	}	
 	function dosubmit_1(){
    	//获取表单提交按钮
   		var btnSubmit = document.getElementById("submit");
    	//将表单提交按钮设置为不可用，这样就可以避免用户再次点击提交按钮
    	btnSubmit.disabled= "disabled";
        //返回true让表单可以正常提交
    	return true;
	}
 </script>

  </head>
  
  <body>
  <%
 		 String token = TokenProccessor.getInstance().makeToken();//创建令牌
         System.out.println("新生成的token："+token);
         session.setAttribute("token", token);  //在服务器使用session保存token(令牌) 
  %>
   
    This is my JSP page. <br>
   
    <p>
    	action测试链接:
    	<a href="${pageContext.request.contextPath }/user/userAction_execute.action?user.userName=zhangsan&user.passWord=123456" style="text-decoration: none;">
    	 	/user/userAction_execute.action
    	</a>
    </p>
    <p>
    	用户登陆测试链接:
    	<a href="${pageContext.request.contextPath }/user/userAction_login.action?user.userName=zhangsan&user.passWord=123456" style="text-decoration: none;">
    		/user/userAction_login.action
   		</a>
    </p>
   	<h3>用户注册:</h3>
    <form action="user/userAction_addUser.action" method="post" onsubmit="return dosubmit();">
    	用户名:<input type="text" name="user.userName">
    	密码:<input type="text" name="user.passWord">
    	<input type="hidden" name="token" value='<c:out value="${sessionScope.token}"></c:out>'/> 
    	<input id="submit" type="submit" value="注册">
    </form>
    <s:fielderror></s:fielderror>
    <h1><c:out value="${sessionScope.token}"></c:out></h1>
  </body>
</html>
