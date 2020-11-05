<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="login" class="Login.LoginBean" scope="page" />
<jsp:setProperty name="login" property="*" />

<HTML>
<HEAD>
	<link rel="stylesheet" href="style.css">
	<TITLE>ch07 : login.jsp </TITLE>
</HEAD>

<BODY>
<div class = "login-box">
	<H2>로그인 예제</H2>
		<div class = "textbox">
<HR>
		<% 
			if(!login.checkUser()) {
				out.println("로그인 실패 !! 아이디 비밀번호를 확인해주세요 !!");	
			}
			else {
				out.println("로그인 성공 !!");
			}
		%>
<HR>
			<div class="textbox">
				입력한 아이디 : <jsp:getProperty name="login"  property="userid" /><BR>
				입력한 패스워드 : <jsp:getProperty name="login" property="passwd" />
			</div>
		</div>
	</div>
</BODY>
</HTML>

