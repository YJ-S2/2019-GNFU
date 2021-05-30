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
<title>후기 리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

<script>
	function reviewList(targetUri) {
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
	<form name="form" method="GET" action="<c:url value='/review/list' />">
		<table style="width: 70%" align=center>
			<tr>
				<td width="20"></td>
				<td>
					<table>
						<tr>
							<td bgcolor="f4f4f4" text-align=center height="22">&nbsp;&nbsp;<b>후기
									리스트</b>&nbsp;&nbsp;
							</td>
						</tr>
					</table> <br>
					<table style="background-color: #89BCDD">
						<tr>
							<td width="190" bgcolor="#89BCDD" height="22">작성자</td>
							<td width="200" bgcolor="#89BCDD">내용</td>
							<td width="200" bgcolor="#89BCDD">상세보기</td>
							<!-- <td width="200" align="center" bgcolor="E6ECDE">삭제하기</td>
						-->
						</tr>

						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td width="190" align="center" bgcolor="ffffff" height="20">
									${review.userId}</td>
								<td width="200" bgcolor="ffffff" style="padding-left: 10">
									${review.content}</td>
								<td width="200" align="center" bgcolor="ffffff" height="20">
									<a
									href="<c:url value='/review/detail'>
				<c:param name='revId' value='${review.revId}'/>
			 	</c:url>">상세보기</a>
								</td>

							</tr>
						</c:forEach>
						<%--
	  }
	}
--%>
					</table> <br>
					<div align=center>
						<a href="<c:url value='/gyn/list'></c:url>">돌아가기</a>
					</div>
					<br>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>