<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*, model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	@SuppressWarnings("unchecked")
	Gyn gyn = (Gyn) request.getAttribute("gyn");
	//String curGynId = (String) request.getAttribute("curGynId");
%>
<html>
<head>
<title>산부인과 리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
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

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #89BCDD;
}
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
	<table style="width: 100%">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="20"></td>
			<td>
				<table align=center>
					<tr>
						<td height="22">&nbsp;&nbsp;<b>병원 리스트</b>&nbsp;&nbsp;
						</td>
					</tr>
				</table> <br>
				<table align=center style="background-color: 89BCDD">
					<tr>
						<td width="190" align="center" bgcolor="89BCDD" height="22">산부인과이름</td>
						<td width="200" align="center" bgcolor="89BCDD">전화번호</td>
						<td width="200" align="center" bgcolor="89BCDD">주소</td>
						<td width="200" align="center" bgcolor="89BCDD">진료시간</td>
						<td width="200" align="center" bgcolor="89BCDD">점심시간</td>
						<td width="200" align="center" bgcolor="89BCDD">야간진료시간</td>
					</tr>

					<tr>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynName}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynTel}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynAddr}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynTime}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynLunch}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20">
							${gyn.gynNight}</td>
					</tr>


				</table> <br>
				<div align=center>
					<a href="<c:url value='/gyn/list'></c:url>">돌아가기</a>
				</div>
				<br>
			</td>
		</tr>
	</table>
</body>
</html>