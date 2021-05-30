<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	@SuppressWarnings("unchecked")
	List<Gyn> gynList = (List<Gyn>) request.getAttribute("gynList");
%>
<html>
<head>
<title>학교별 병원 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

<style>
<
style>table {
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
	<form name="form" action="<c:url value='/gyn/list' />">
		<br>
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
									<b>학교 리스트</b>
								</h2>&nbsp;&nbsp;
							</td>
						</tr>
					</table> <br>
					<table align="center">
						<tr>
							<td width="200" align="center" bgcolor="89BCDD">학교 선택</td>
							<td width="200" align="center" bgcolor="89BCDD">병원 이름</td>
							<td width="200" align="center" bgcolor="89BCDD">전화번호</td>
							<td width="200" align="center" bgcolor="89BCDD">주소</td>
							<td width="200" align="center" bgcolor="89BCDD">상세보기</td>
							<td width="200" align="center" bgcolor="89BCDD">후기쓰기</td>
							<td width="200" align="center" bgcolor="89BCDD">후기보기</td>
						</tr>
						<tr>
							<td><select name="uni_id" align="center">
									<option>학교선택</option>
									<option value="U_01">경인여자대학교</option>
									<option value="U_02">덕성여자대학교</option>
									<option value="U_03">동덕여자대학교</option>
									<option value="U_04">배화여자대학교</option>
									<option value="U_05">서울여자대학교</option>
									<option value="U_06">성신여자대학교</option>
									<option value="U_07">수원여자대학교</option>
									<option value="U_08">숙명여자대학교</option>
									<option value="U_09">숭의여자대학교</option>
									<option value="U_10">이화여자대학교</option>
									<option value="U_11">한양여자대학교</option>
							</select> <input type="submit" value="확인"></td>
						</tr>

						<c:forEach var="gyn" items="${gynList}" varStatus="status">
							<tr>
								<td><c:out value="${status.count}" /> &nbsp;</td>
								<td width="190" align="center" bgcolor="ffffff" height="20">
									${gyn.gynName}</td>
								<td width="190" align="center" bgcolor="ffffff" height="20">
									${gyn.gynTel}</td>
								<td width="190" align="center" bgcolor="ffffff" height="20">
									${gyn.gynAddr}</td>
								<td width="200" align="center" bgcolor="ffffff" height="20">
									<a
									href="<c:url value='/gyn/detail'>
		  				<c:param name='gynId' value='${gyn.gynId}'/> </c:url>">상세보기</a>
								</td>

								<td width="200" align="center" bgcolor="ffffff" height="20">
									<a
									href="<c:url value='/review/view'>
			 			<c:param name='getgynId' value='${gyn.gynId}'/> </c:url>">후기
										쓰기</a>
								</td>

								<td width="200" align="center" bgcolor="ffffff" height="20">
									<a
									href="<c:url value='/review/list'>
			 			<c:param name='getgynId' value='${gyn.gynId}'/> </c:url>">후기
										보기</a>
								</td>

							</tr>
						</c:forEach>


					</table> <br>
				</td>
			</tr>
		</table>
		<br>
		<div align=center>
			<a href="<c:url value='/user/connecter'></c:url>">돌아가기</a>
		</div>
		<br>
	</form>
</body>
</html>