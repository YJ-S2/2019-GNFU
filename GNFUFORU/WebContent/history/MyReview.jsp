<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<%
	@SuppressWarnings("unchecked")
	List<Review> ureviewList = (List<Review>) request.getAttribute("ureviewList");
	Review ureview = (Review) request.getAttribute("ureview");
%>
<!DOCTYPE html>

<html>
<head>
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
</style>

<meta charset="EUC-KR">
<title>내가 작성한 후기 관리</title>
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
		<form name=form1>
			<input type="hidden" name="userId" value="${userId}" />
			<table style="width: 70%" align=center>
				<tr>

					<th id=date bgcolor=#EAEAEA>작성날짜</th>

					<th id=writer bgcolor=#EAEAEA>내용</th>
					<th id=title bgcolor=#EAEAEA>산부인과 명</th>
				</tr>



				<c:forEach var="ureview" items="${ureviewList}">
					<tr>

						<td width="200" align="center" bgcolor="ffffff"
							style="padding-left: 10">${ureview.date}</td>
						<td width="190" align="center" bgcolor="ffffff" height="20"><a
							href="<c:url value='/review/Mydetail'>
                  <c:param name='revId' value='${ureview.revId}'/>
                   </c:url>">${ureview.content}</a>
						</td>
						<td width="200" align="center" bgcolor="ffffff" height="20">
							${ureview.gynName}</td>
					</tr>
				</c:forEach>
				</form>
			</table>

			<br /> <br />

			<form name="form2" method="POST" action="<c:url value='/user/his' />">
				<input type="submit" value="뒤로가기">
			</form>
	</div>
	&nbsp; &nbsp;

</body>
</html>