package cn.com.kid.action;

import javax.servlet.http.HttpServletRequest;

import cn.com.kid.entity.Users;

public class UserAction extends BaseAction{
	String className = this.getClass().getName();
	private Users user;
	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("run execute:"+className);
		String User_agent = request.getHeader("User-Agent");
		System.out.println("User-Agent:"+User_agent);
		if (User_agent.indexOf("Windows NT")>=0) {
			System.out.println("PC端访问");
		}else if (User_agent.indexOf("iPhone")>=0) {
			System.out.println("iPhone手机访问");
		}else if (User_agent.indexOf("Linux; U;")>=0||User_agent.indexOf("Android")>=0) {
			System.out.println("Android手机访问");
		}
		return SUCCESS;
	}
	
	@Override
	public void validate() {
		System.out.println("run validate:"+className);
		if (request.getRequestURI().endsWith("logout.action")) {
			return;
		}
		if (user==null) {
			this.addFieldError("msg", "登陆信息为空!"); 
		}else if (user.getUserName()==null||"".equals(user.getUserName())) {
			this.addFieldError("msg", "用户名不能为空!"); 
		}else if (user.getPassWord()==null||"".equals(user.getPassWord())) {
			this.addFieldError("msg", "密码不能为空!"); 
		}
	}
	
	//用户登陆动作
	public String login(){
		System.out.println("run login:"+className);
		//if (dao.usersLogin(user)) {
		if (true) {
			session.setAttribute("loginUserName", user.getUserName());
			return SUCCESS;
		}else {
			this.addFieldError("msg", "用户名或密码错误!"); 
			return INPUT;
		}
	}
	
	//用户注销动作
	public String logout(){
		System.out.println("run logout:"+className);
		if (session.getAttribute("loginUserName")!=null) {
			session.removeAttribute("loginUserName");
		}
		return "logout_success";
	}
	 
	public String addUser(){
		System.out.println("run addUser:"+className);
		if (isRepeatSubmit(this.request)) {
			this.addFieldError("msg", "请不要重复提交!"); 
            return INPUT;
		} 
		session.removeAttribute("token");//移除session中的token
        System.out.println("处理用户注册请求！！");
		//if (dao.addUser(user)) {
        if (true) {
			this.addFieldError("msg", "用户注册成功!"); 
			return SUCCESS;
		}
		this.addFieldError("msg", "用户注册失败!"); 
		return INPUT;
	}
	
	/**
     * 判断客户端提交上来的令牌和服务器端生成的令牌是否一致
     * @param request
     * @return 
     *         true 用户重复提交了表单 
     *         false 用户没有重复提交表单
     */
    private boolean isRepeatSubmit(HttpServletRequest request) {
        String client_token = request.getParameter("token");
        //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
        if(client_token==null){
            return true;
        }
        //取出存储在Session中的token
        String server_token = (String) request.getSession().getAttribute("token");
        //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
        if(server_token==null){
            return true;
        }
        //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
        if(!client_token.equals(server_token)){
            return true;
        }
        
        return false;
    }
}
