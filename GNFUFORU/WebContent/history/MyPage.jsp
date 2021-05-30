<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>My Page</title>
<style>
.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}

.mb-5, .my-5 {
	margin-bottom: 3rem !important;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
}

.card-text:last-child {
	margin-bottom: 0;
}

.card-footer:last-child {
	border-radius: 0 0 calc(.25rem - 1px) calc(.25rem - 1px);
}

.btn-group-sm>.btn, .btn-sm {
	padding: .25rem .5rem;
	font-size: .875rem;
	line-height: 1.5;
	border-radius: .2rem;
}

.card-footer {
	padding: .75rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 1px solid rgba(0, 0, 0, .125);
}

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

.col, .col-1, .col-10, .col-11, .col-12, .col-2, .col-3, .col-4, .col-5,
	.col-6, .col-7, .col-8, .col-9, .col-auto, .col-lg, .col-lg-1,
	.col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4,
	.col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-auto,
	.col-md, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2,
	.col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8,
	.col-md-9, .col-md-auto, .col-sm, .col-sm-1, .col-sm-10, .col-sm-11,
	.col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
	.col-sm-7, .col-sm-8, .col-sm-9, .col-sm-auto, .col-xl, .col-xl-1,
	.col-xl-10, .col-xl-11, .col-xl-12, .col-xl-2, .col-xl-3, .col-xl-4,
	.col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-auto {
	position: relative;
	width: 100%;
	padding-right: 60px;
	padding-left: 60px;
}

.col-md-4 {
	-ms-flex: 0 0 33.333333%;
	flex: 10 20;
	max-width: 50%;
}
</style>

<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">
</head>
<body>
	<ul>
		<li><a href="#">지니포유GNFU</a></li>
		<li><a href="<c:url value='/user/connecter'></c:url>">질병 코드
				검색</a></li>
		<li><a href="<c:url value='/gyn/list' />"><input
				type="hidden" name="userId" value="${userId}" />학교별 병원 조회</a></li>
		<li><a href="<c:url value='/user/his' />">마이페이지</a></li>
		<li style="float: right"><a class="active"
			href="<c:url value='/user/logout' />">로그아웃(&nbsp;${userId}&nbsp;)</a></li>
	</ul>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="row">
		<div class="col-md-4 mb-5">
			<div class="card h-100">
				<div class="card-body">
					<h2 class="card-title">내정보</h2>
				</div>
				<div class="card-footer">
					<form name="form1" method="GET"
						action="<c:url value='/user/view'></c:url>">
						<input type="hidden" name="userId" value="${userId}" /> <input
							type="submit" value="상세보기">
					</form>
				</div>
			</div>
		</div>
		<!-- /.col-md-4 -->
		<div class="col-md-4 mb-5">
			<div class="card h-100">
				<div class="card-body">
					<h2 class="card-title">내 진단정보 관리</h2>
				</div>
				<div class="card-footer">
					<form name="form2" method="POST"
						action="<c:url value='/userHis/search' />">
						<input type="hidden" name="userId" value="${userId}" /> <input
							type="submit" value="상세보기" />
					</form>
				</div>
			</div>
		</div>
		<!-- /.col-md-4 -->
		<div class="col-md-4 mb-5">
			<div class="card h-100">
				<div class="card-body">
					<h2 class="card-title">내 후기 관리</h2>
				</div>
				<div class="card-footer">
					<form name="form3" method="POST"
						action="<c:url value='/userHis/reviewSearch' />">
						<input type="hidden" name="userId" value="${userId}" /> <input
							type="submit" value="My후기 관리" />
					</form>


				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>