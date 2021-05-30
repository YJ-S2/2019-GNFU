<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>KCD 검색</title>
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
<script>

function search(targetUri) {
	
	if (form.diskcd.value == "") {
		form.diskcd.focus();
		return false;
	} 
	
	form.action = targetUri;
	form.submit();
}
</script>
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


	<form name="form" action="<c:url value='/disease/search' />">
		<!-- method="get"-->
		<br>
		<table style="width: 100%">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="20"></td>
				<td>
					<table>
						<tr>
							<td></td>
						</tr>
					</table> <br>
					<table align="center">
						<tr>

							<td width="500" align="center" bgcolor="white">
								<h2>
									<b>질병 코드 검색하기</b>
								</h2> <br>
							<br> <input type="text" name="diskcd"
								placeholder="질병 코드를 입력하세요"> <input type="button"
								value="검색" onclick="search('<c:url value='/disease/search' />')">
							</td>
						</tr>
					</table>
			</tr>
		</table>

	</form>
</body>
</html>