<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	@SuppressWarnings("unchecked")
	List<Disease> diseaseList = (List<Disease>) request.getAttribute("diseaseList");
	User user = (User) request.getAttribute("user");
	Disease dis = (Disease) request.getAttribute("disKcd");
%>
<html>
<head>
<title>질병코드 검색 결과</title>
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

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}

.button {
	background-color: #0000000; /* Green */
	border: none;
	color: black;
	padding: 6px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}
</style>
<script>
	function save() {

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


	<form name="form" method="POST"
		action="<c:url value='/disSave/save' />">
		<input type="hidden" name="disSaveKcd" value="${dis.disKcd}" /> <br>
		<table style="width: 100%" align="center">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="20"></td>
				<td>
					<table align="center">
						<tr>
							<td height="22" align="center">&nbsp;&nbsp;
								<h2>
									<b>질병코드 검색 결과</b>
								</h2>&nbsp;&nbsp;
							</td>
						</tr>
					</table> <br>
					<table style="background-color: rgb(184, 220, 243)" align="center">
						<tr>
							<td width="200" align="center" bgcolor="89BCDD">질병 코드</td>
							<td width="200" align="center" bgcolor="89BCDD">질병 이름</td>
						</tr>
						<c:forEach var="dis" items="${disList}">
							<tr>
								<td width="200" bgcolor="FFFFFF" style="padding-left: 10"
									height="20">${dis.disKcd}</td>
								<td width="300" bgcolor="FFFFFF" style="padding-left: 10">
									${dis.disName}</td>
							</tr>

						</c:forEach>
					</table> <br> <br>
					<div align=center>
						<input type="button" class="button button2" value="내 질병정보 추가하기"
							onClick="save()"> &nbsp;&nbsp;&nbsp; <a
							href="<c:url value='/user/connecter'></c:url>">돌아가기</a>
					</div>


				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
</body>
</html>