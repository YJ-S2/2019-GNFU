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
<title>���� ����</title>
</head>
<body>
	<h1 style="color: #246997;">
		<b>�ı� �����ϱ�</b>
	</h1>

	<div align=center>
		<table>
			<tr>
				<td text-align=center id = title1>����</td>
				<td><input type=text id = title2></td>
			</tr>
			<tr>
				<td colspan='2'><textarea id=rev></textarea></td>
		</table>
	</div>
	&nbsp;&nbsp;
	<div id="date">��¥ : &nbsp;</div>
	&nbsp;&nbsp;

	<div align=right>
		<select><option>���� ����</option>
			<option>5��</option>
			<option>4��</option>
			<option>3��</option>
			<option>2��</option>
			<option>1��</option></select> &nbsp; &nbsp;

		<form name=form1 action="MyPage.jsp">
			<input type="submit" value="�������" />
		</form>

		<form name=form2 action= "<c:url value='/review/delete' />">
			<input type="submit" value="�����Ϸ�" />
		</form>
	</div>
</body>
</html>