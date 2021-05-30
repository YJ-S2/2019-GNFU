<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Review review = (Review) request.getAttribute("review");
%>
<html>
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
<title>후기 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<script>
	function deleteReview(targetUri) {
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
	<br>
	<!-- Detail Form  -->

	<table style="width: 100%" align=center>
		<tr>
			<td width="20"></td>
			<td>
				<table align=center>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>후기 - 수정</b>&nbsp;&nbsp;
						</td>
					</tr>
				</table> <br>
				<table style="background-color: #89BCDD" align=center>
					<tr height="40">
						<td width="150" align="center" bgcolor="#89BCDD">작성자</td>
						<td width="250" bgcolor="ffffff" style="padding-left: 10">
							${review.userId}</td>
					</tr>
					<tr height="40">
						<td width="150" align="center" bgcolor="#89BCDD">산부인과명</td>
						<td width="250" bgcolor="ffffff" style="padding-left: 10">
							${review.gynName}</td>
					</tr>
					<tr height="40">
						<td width="150" align="center" bgcolor="#89BCDD">날짜</td>
						<td width="250" bgcolor="ffffff" style="padding-left: 10">
							${review.date}</td>
					</tr>
					<tr height="40">
						<td width="150" align="center" bgcolor="#89BCDD">평점</td>
						<td width="250" bgcolor="ffffff" style="padding-left: 10">
							${review.grade}</td>
					</tr>
					<tr height="40">
						<td width="150" align="center" bgcolor="#89BCDD">내용</td>
						<td width="250" bgcolor="ffffff" style="padding-left: 10">
							${review.content}</td>
					</tr>
				</table> <br>
			<div align=center>
					<a
						href="<c:url value='/userHis/ReviewUpdate/form'><c:param name='revId' value='<%=review.getRevId()%>'/><c:param name='getgynId' value='<%=review.getGynId()%>'/></c:url>">
						수정 </a>&nbsp;&nbsp; <a
						href="<c:url value='/userHis/Mydelete'>
			<c:param name='getgynId' value='<%=review.getGynId()%>'/><c:param name='revId' value='<%=review.getRevId()%>'/><c:param name='userId' value='<%=review.getUserId()%>'/></c:url>">
						삭제</a>&nbsp;&nbsp; <a
						href="<c:url value='/userHis/reviewSearch'><c:param name='getgynId' value='<%=review.getGynId()%>'/><c:param name='userId' value='<%=review.getUserId()%>'/></c:url>">
						목록 </a>
				</div>
</body>
</html>