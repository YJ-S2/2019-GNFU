<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="date" class="java.util.Date" />
<%@page import="model.*"%>
<%@page import="model.dao.*"%>
<%@page import="java.util.*"%>
<%
	Gyn gyn = (Gyn) request.getAttribute("gyn");
%>
<html>
<head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
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

<title>후기 작성페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">



<script>
function reviewCreate() {
	if (form.content.value == "") {
		alert("내용을 입력하시오.");
		form.content.focus();
		return false;
	} 


	if (form.grade.value == "") {
		alert("평점을 입력해주세요");
		form.grade.focus();
		return false;
	}

	form.submit();
}

function reviewList(targetUri) {
	form.action = targetUri;
	form.submit();
}
function reviewCreate() {
	   if (form.content.value == "") {
	      alert("내용을 입력하시오.");
	      form.content.focus();
	      return false;
	   } 

	   if (form.grade.value == "") {
	      alert("평점을 입력해주세요");
	      form.grade.focus();
	      return false;
	   }
	   
	   if (form.grade.value > 5 || form.grade.value <= 0) {
	      alert ("1 ~ 5 사이의 점수를 입력해주세요");
	      form.grade.focus();
	      return false;
	   }
	       
	   form.submit();
	}
</script>
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<ul>
		<li><a href="#home">Home</a></li>
		<li><a href="<c:url value='/user/connecter'></c:url>">질병 코드
				검색</a></li>
		<li><a href="<c:url value='/gyn/list' />">학교별 병원 조회</a></li>
		<li><a href="<c:url value='/user/his' />">마이페이지</a></li>
		<li style="float: right"><a class="active"
			href="<c:url value='/user/logout' />">로그아웃(&nbsp;${userId}&nbsp;)</a></li>
	</ul>
	<br>
	<!-- 후기 작성 form  -->

	<form name="form" method="POST"
		action="<c:url value='/review/insert' />">
		<input type = hidden name = gynId value = "${gyn.gynId }"/>
		<table style="width: 70%" align=center>
			<tr>
				<td width="20"></td>
				<td>
					<table>
						<tr>
							<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>후기 작성</b>&nbsp;&nbsp;
							</td>
						</tr>
					</table> <br>
					<table style="background-color: #89BCDD">
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">산부인과명</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10">

								${gyn.gynName}</td>
						</tr>
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">작성 날짜</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><fmt:formatDate
									value="${date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">평점</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="number" style="width: 240" name="grade" min="0" max="5">
							</td>
						</tr>
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">내용쓰기</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="text" style="width: 240" name="content"></td>
						</tr>
					</table> <br>
					<table style="width: 100%">
						<tr>
							<td align="left"><input type="button" value="목록"
								onClick="reviewList('<c:url value='/review/list' />')">
								<input type="button" value="확인" onClick="reviewCreate()">
								&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>