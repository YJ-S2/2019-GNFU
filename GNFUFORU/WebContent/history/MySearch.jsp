<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%
	@SuppressWarnings("unchecked")
	List<Disease> saveList = (List<Disease>) request.getAttribute("saveList");
	Disease MySave = (Disease) request.getAttribute("MySave");
%>
<!DOCTYPE html>

<html>
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<head>

<style>
table {
	align: 'center';
	width: '80%';
	border: '0';
	cellspacing: '0';
	cellpadding: '0';
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
<meta charset="EUC-KR">
<title>내 진단정보 관리</title>
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
	<br />
	<br />

	<form name="form1" method="POST"
		action="<c:url value='/userHis/saveDelete' />">
		<table style="width: 70%" align=center>

			<tr>


				<th bgcolor=#EAEAEA>저장날짜</th>
				<th bgcolor=#EAEAEA>질병코드</th>
				<th bgcolor=#EAEAEA>질병명</th>
				<th bgcolor=#EAEAEA>선택</th>
			</tr>
			<c:forEach var="MySave" items="${saveList}">

				<tr>
					<td width="190" align="center" bgcolor="ffffff" height="20">
						${MySave.cDate}</td>
					<td width="200" align="center" bgcolor="ffffff"
						style="padding-left: 10">${MySave.disSaveKcd}</td>
					<td width="200" align="center" bgcolor="ffffff" height="20">
						${MySave.disSaveKcdName}</td>
					<td align=center width=30px><input type=radio name='delete'
						value="${MySave.saveId}" /></td>


				</tr>
			</c:forEach>

		</table>
		<br> <br>
		<div align=center>
			<input type="submit" id=in value="선택삭제" />
			<form name="form1" method="POST" action="<c:url value='/user/his' />">
				<input type="submit" id=in value="뒤로가기" />
			</form>
		</div>
	</form>




</body>
</html>