<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

%>
<HTML>
<HEAD>
<script src="https://kit.fontawesome.com/3fd00d3a8b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style.css">
<TITLE>ch08 : JDBC 테스트 </TITLE>
</HEAD>

<BODY>
	<form name=form1 method=post action=jdbctest.jsp>
		<div class = "box">
			<H2>Event Registration</H2>
				<div class = "textbox">
					<i class="fas fa-user"></i>
					<input type="text" placeholder="이름을 입력해주세요" name="username">
				</div>
				<div class = "textbox">
					<i class="fas fa-at"></i>
					<input type="text" placeholder="이메일을 입력해주세요" name=email>
				</div>
				<div>
					<input class="btn" type="submit" name="Submit" value="등록">
				</div>
# 등록 목록<P>
<%
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);

		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"root","q2208080");
		
		// select 문장을 문자열 형태로 구성한다.
		String sql = "select username from jdbc where username=?";
		Boolean loop = true;
		
		pstmt = conn.prepareStatement(sql);
		String user = request.getParameter("username");
		pstmt.setString(1,user);

		// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
		ResultSet rs = pstmt.executeQuery();
		int i=1;

		// 마지막 데이터까지 반복함.
		while(rs.next()) {
			if(rs.getString("username").equals(user)){
				%><script>alert('등록된 회원입니다.');</script><%
				loop=false;
				break;
			}
		}
		
		if(loop){
			String Xsql = "insert into jdbc values(?,?)";
			pstmt = conn.prepareStatement(Xsql);
			pstmt.setString(1,request.getParameter("username"));
			pstmt.setString(2,request.getParameter("email"));

			// username 값을 입력한 경우 sql 문장을 수행.
			if(request.getParameter("username") != null) {
				pstmt.executeUpdate();
			}
		}
	}
	catch(Exception e) {
		System.out.println(e);
	}
%>
				
			</div>
		</form>
ㄴ
</BODY>
</HTML>