<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="Addresss.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="am" class="Addresss.AddrManager" scope="application"/>

<html>
	<head>
		<script src="https://kit.fontawesome.com/3fd00d3a8b.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ch07 : 주소록 목록</title>
		<script>
		function idDelete(delID){
			am.deleteAddr();
		}
		</script>
	</head>

	<body>
		<div class = "box">
			<H2>Address List</H2>
		
		<a href="addr_form.html">Add Address</a><P>
		
		<table border=1 width=500>
			<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>삭제</td></tr>
				<%
					for(AddrBean ab : am.getAddrList()) {
				%>
			<tr>
			<td><%=ab.getUsername() %></td>
			<td><%=ab.getTel() %></td>
			<td><%=ab.getEmail() %></td>
			<td><%=ab.getSex() %></td>
			<td><input type="button" value="삭제" onclick="idDelete('<%=ab.getUsername()%>');"/></td></tr>
				<%	
					}
				%>
		</table>
		</div>
	</body>
</html>


