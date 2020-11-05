<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="Addresss.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="addr" class="Addresss.AddrBean"/>
<jsp:setProperty name="addr" property="*"/>
<jsp:useBean id="am" class="Addresss.AddrManager" scope="application"/>

<%
	am.add(addr);
%>

<html>
	<head>
		<script src="https://kit.fontawesome.com/3fd00d3a8b.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ch07 : addr_add.jsp</title>
	</head>
	
	<body>
		<div class = "box">
		<H2>Registration Content</H2>

		<div class="textbox">
		<i class="fas fa-user"></i>
			<jsp:getProperty property="username" name="addr"/><P>
		</div>
		
		<div class="textbox">
		<i class="fas fa-phone-volume"></i>
			<%=addr.getTel() %><P>
		</div>
		
		<div class="textbox">
		<i class="fas fa-at"></i>
			<%=addr.getEmail() %><P>
		</div>
		
		<div class="textbox">
		<i class="fas fa-venus-mars"></i>
			 <%=addr.getSex() %>
		</div>
		<br>
			<a href="addr_list.jsp">목록 보기</a>
		</div>
	</body>
</html>










