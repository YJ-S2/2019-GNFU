<%@page contentType="text/html; charset=utf-8"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) request.getAttribute("user");
%>
<html>
<head>
<title>내 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<script>
	function userModify() {
		if (form.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if (form.password.value != form.password2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.name.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.name.focus();
			return false;
		}
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (emailExp.test(form.email.value) == false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (phoneExp.test(form.phone.value) == false) {
			alert("전화번호 형식이 올바르지 않습니다.");
			form.phone.focus();
			return false;
		}
		form.submit();
	}
	function back(targetUri) {
		form.action = targetUri;
		form.submit();
	}
</script>
<style>
#table {
	border: 1px solid #CCCCCC;
	border-collapse: collapse;
}

#th, #td {
	border: 1px solid #CCCCCC;
	color: #22266E;
}

#table {
	height: 300px;
}

#th {
	width: 150px;
}

#td {
	width: 300px;
}

form {
	display: inline;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #111;
}
</style>
</head>
<body>

	<ul>
		<li><a href="#">지니포유GNFU</a></li>
		<li><a href="<c:url value='/user/connecter'></c:url>">질병 코드
				검색</a></li>
		<li><a href="<c:url value='/gyn/list' />">학교별 병원 조회</a></li>
		<li><a href="<c:url value='/user/his' />">마이페이지</a></li>
		<li style="float: right"><a class="active"
			href="<c:url value='/user/logout' />">로그아웃(&nbsp;${userId}&nbsp;)</a></li>
	</ul>



	<br>
	<br>

	<div align=center>
		<form name="form" method="POST"
			action="<c:url value='/user/update' />">
			<input type="hidden" name="userId" value="<%=user.getUserId()%>" />
			<table id=table text-align=center>
				<tr>
					<th id=th bgcolor="#EAEAEA">사용자 ID</th>
					<td id=td><%=user.getUserId()%></td>
				</tr>
				<tr>
					<th id=th bgcolor="#EAEAEA">비밀번호</th>
					<td id=td><input type="password" name="password"
						value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<th id=th bgcolor="#EAEAEA">비밀번호 확인</th>
					<td id=td><input type="password" name="password2"
						value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<th id=th bgcolor="#EAEAEA">이름</th>
					<td id=td><input type="text" name="name"
						value="<%=user.getName()%>"></td>
				</tr>
				<tr>
					<th id=th bgcolor="#EAEAEA">전화번호</th>
					<td id=td><input type="text" name="phone"
						value="${user.phone}"></td>
				</tr>
				<tr>
					<th id=th bgcolor="#EAEAEA">이메일 주소</th>
					<td id=td><input type="text" name="email"
						value="${user.email}"></td>

				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td align="right"><input type="button" value="수정하기"
						onClick="userModify()"> &nbsp; <input type="button"
						value="뒤로가기" onClick="back('<c:url value='/user/his'/>')">
					</td>
				</tr>
			</table>
		</form>
	</div>






</body>
</html>