<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이벤트</title>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/event_style.css">
	<link href="/resources/mcss/event_mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/event_tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
</head>
<body>
	<section>
		<div id="eventLogo">
			<h2>
				<img src="/resources/img/event_title.jpg">
			</h2>
		</div>
		<div id="contentWrap">
			<div id="event1">
				<div class="thumbnail">
					<img alt="" src="/resources/img/event_thumbnail1.jpg">
				</div>
				<div class="explain">
					<h2>서머 3 프로모션</h2>
					<p><span>기간 : </span>2020년 8월 7일~2020년 9월 6일</p>
				</div>
				<div class="progress_in">
					<p>진행중</p>
				</div>
			</div>
			<div id="event2">
				<div class="thumbnail">
					<img alt="" src="/resources/img/event_thumbnail2.jpg">
				</div>
				<div class="explain">
					<h2>서머 3 Tri-Star Dash</h2>
					<p><span>기간 : </span>2020년 7월 23일~2020년 8월 5일</p>
				</div>
				<div class="progress_out">
					<p>종료</p>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>

<%@ include file="../includes/footer.jsp"%>
