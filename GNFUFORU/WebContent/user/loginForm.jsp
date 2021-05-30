<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>지니포유;)</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
<style>
.btnblue {
	color: white;
	text-align: center;
	background-color: #4F94E3;
	border: 0px;
	border-radius: 5px;
}
</style>
<script>
function login() {
	if (form.userId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}		
	
	
	form.submit();
	
}

function userCreate(targetUri2) {
	form.action = targetUri2;
	form.submit();
}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<br>
	<!-- login form  -->
	<form name="form" method="POST" action="<c:url value='/user/login' />">
		<table align=center>
			<tr>
				<td width="20"></td>
				<td>
					<table>
						<tr>
							<td style="color: #4B73BE;" height="22"><img
								src="https://img.icons8.com/bubbles/50/000000/half-heart.png">&nbsp;<b>지니포유
									(Gyn + info + you)</b>&nbsp;&nbsp;</td>
						</tr>
					</table> <!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 --> <c:if
						test="${loginFailed}">
						<br>
						<font color="red"><c:out value="${exception.getMessage()}" /></font>
						<br>
					</c:if> <br>
					<table style="background-color: #89BCDD">
						<tr height="40">
							<td width="150" align="center" bgcolor="89BCDD"><img
								src="https://img.icons8.com/dusk/64/000000/add-user-female.png"></td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="text" style="width: 240" name="userId"></td>
						</tr>
						<tr height="40">
							<td width="150" align="center" bgcolor="89BCDD"><img
								src="https://img.icons8.com/dusk/64/000000/password.png"></td>
							<td width="250" bgcolor="ffffff" style="padding-left: 10"><input
								type="password" style="width: 240" name="password"></td>
						</tr>
					</table> <br>
					<table style="width: 100%">
						<tr>
							<td align=left><input type="button" class="btnblue"
								value="로그인" onClick="login()"> &nbsp; <input
								type="button" class="btnblue" value="회원가입"
								onClick="userCreate('<c:url value='/user/register/form'/>')">
							</td>
						</tr>

					</table>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>