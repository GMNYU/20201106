<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스타벅스 공지사항</title>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/notice_style.css">
	<link href="/resources/tcss/notice_tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
</head>
<body>
<div id="title">
		<h2>
			<img src="/resources/img/title.jpg">
		</h2>
	</div>
	<div id="container">
		<table summary="공지사항" class="notice_tb">
			<caption class="hid">공지사항 번호, 제목, 날짜</caption>
			<colgroup>
				<col width="5.45454%">
				<col width="74.5454%">
				<col width="10.90909%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody class="title1">
				<tr>
					<td class="num">1</td>
					<td class="title_left"><a href="notice200824.html">모바일 화면 시스템 개선 및 점검 안내</a></td>
					<td class="data">2020/08/24</td>
				</tr>
				<tr>
					<td class="num">2</td>
					<td class="title_left"><a href="notice200822.html">시스템 개선 및 점검 안내</a></td>
					<td class="data">2020/08/22</td>
				</tr>
				<tr>
					<td class="num">3</td>
					<td class="title_left"><a href="notice200817.html">홈 페이지 오픈 안내</a></td>
					<td class="data">2020/08/17</td>
				</tr>
			</tbody>
		</table>
		<div class="pagination">
			<ul>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
			</ul>
		</div>
	</div>
</body>
</html>

<%@ include file="../includes/footer.jsp"%>