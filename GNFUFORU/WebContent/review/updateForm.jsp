<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>
<%@page import="model.dao.*"%>
<%@page import="controller.user.*"%>
<%@page import="java.util.*"%>
<%
	@SuppressWarnings("unchecked")
	List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
	Review review = (Review) request.getAttribute("review");

	String loginedUserId = UserSessionUtils.getLoginUserId(request.getSession());
%>


<html>
<head>
<style>
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

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<title>후기 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<script>
function reviewModify() {
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
	<!-- Update Form  -->
	<form name="form" method="POST"
		action="<c:url value='/review/update' />">
		<input type="hidden" name="getgynId"
			value="<%=request.getParameter("getgynId")%>" /> <input type="hidden"
			name="revId" value="<%=request.getParameter("revId")%>" /> <input
			type="hidden" name="userId"
			value="<%=request.getParameter("userId")%>" />
		<table style="width: 70%" align=center>
			<tr>
				<td width="20"></td>
				<td>
					<table>
						<tr>
							<td talign="center" bgcolor="f4f4f4" height="22">&nbsp;&nbsp;
								<b> 후기 - 수정</b>&nbsp;&nbsp;
							</td>
						</tr>
					</table> <br>
					<table style="background-color: #89BCDD">
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">산부인과명</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><%=review.getGynName()%></td>
						</tr>

						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">평점</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="number" style="width: 240" name="grade" min="0" max="5"
								value="<%=review.getGrade()%>"></td>
						</tr>
						<tr height="40">
							<td width="150" align="center" bgcolor="#89BCDD">내용쓰기</td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="text" style="width: 240" name="content"
								value="<%=review.getContent()%>"></td>
						</tr>
					</table> <br>
					<table style="width: 100%">
						<tr>
							<td align="left"><input type="button" value="수정"
								onClick="reviewModify()"> &nbsp; &nbsp; &nbsp; <input
								type="button" value="취소"
								onClick="reviewList('<c:url value='/review/list' />')">
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>