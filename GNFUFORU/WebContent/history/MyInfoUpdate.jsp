<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>

<%
	User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

<style>
table {
	border: 1px solid #CCCCCC;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #CCCCCC;
	color: #22266E;
}

table {
	height: 300px;
}

th {
	width: 100px;
}

td {
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

li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#111
;


}
.active {
	background-color: #89BCDD;
}
</style>
<script>
	function userRemove() {
		return confirm("정말 탈퇴하시겠습니까?");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>내 정보</title>
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



	<h1 style="color: #246997;">
		<b>내 정보</b>
	</h1>

	<div align=center>
		<input type="hidden" name="userId" value="<%=user.getUserId()%>" />
		<table text-align=center>

			<tr>
				<th bgcolor=#EAEAEA>ID</th>
				<td><%=user.getUserId()%></td>
			</tr>
			<tr>
				<th bgcolor=#EAEAEA>PW</th>
				<td><%=user.getPassword()%></td>
			</tr>

			<tr>
				<th bgcolor=#EAEAEA>이름</th>
				<td><%=user.getName()%></td>
			</tr>

			<tr>
				<th bgcolor=#EAEAEA>전화번호</th>
				<td>${user.phone}</td>
			</tr>

			<tr>
				<th bgcolor=#EAEAEA>이메일 주소</th>
				<td>${user.email}</td>
			</tr>

		</table>


	</div>
	<div align=right>
		<form name="form1" method="POST" action="<c:url value='/user/his' />">
			<input type="submit" value="뒤로가기">
		</form>



		<form name="form2" method="GET"
			action="<c:url value='/user/update/form'></c:url>">
			<input type="hidden" name="userId" value="${userId}" /> <input
				type="submit" value="수정하기" />
		</form>

		<form name="form3" method="POST"
			action="<c:url value='/user/delete'></c:url>">
			<input type="hidden" name='userId' value="${userId}" /> <input
				type="submit" value="탈퇴" onclick="userRemove();" />
		</form>
	</div>

</body>
</html>
