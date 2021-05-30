<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<style>
#rev {
	width: 800px;
	height: 300px;
	border: 1px solid #CCCCCC;
}

form {
	display: inline;
}

#date {
	margin-left: 250px;
}
#title1{
width:50px;

}
#title2{
width:740px;
border: 1px solid #CCCCCC;}
</style>
<meta charset="EUC-KR">
<title>리뷰 수정</title>
</head>
<body>
	<h1 style="color: #246997;">
		<b>후기 수정하기</b>
	</h1>

	<div align=center>
		<table>
			<tr>
				<td text-align=center id = title1>제목</td>
				<td><input type=text id = title2></td>
			</tr>
			<tr>
				<td colspan='2'><textarea id=rev></textarea></td>
		</table>
	</div>
	&nbsp;&nbsp;
	<div id="date">날짜 : &nbsp;</div>
	&nbsp;&nbsp;

	<div align=right>
		<select><option>병원 평점</option>
			<option>5점</option>
			<option>4점</option>
			<option>3점</option>
			<option>2점</option>
			<option>1점</option></select> &nbsp; &nbsp;

		<form name=form1 action="MyPage.jsp">
			<input type="submit" value="수정취소" />
		</form>

		<form name=form2 action= "<c:url value='/review/delete' />">
			<input type="submit" value="수정완료" />
		</form>
	</div>
</body>
</html>