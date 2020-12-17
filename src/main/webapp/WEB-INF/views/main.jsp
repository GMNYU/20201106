<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인</title>
  
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link href="/resources/mcss/mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
</head>	
<body>	
		<div id="a">
			<img alt="" src="/resources/img/divA_emblem.png" id="s3emb">
				<div id="Atextbox">
					<a href="/menu/beverage">자세히 보기</a>
				</div>
			<img alt="" src="/resources/img/divA_bev.png" id="bev">
		</div>
		<div id="b">
			<div id="Btitle">
				<h2>공지사항</h2>
			</div>
			<div id="Btextbox">
			<a href="notice200824.html">모바일 화면 시스템 개선 및 점검 안내</a>
			</div>
		</div>
		<div id="c">
			<img alt="" src="/resources/img/divC_emblem.png" id="s2emb">
			<div id="Ctextbox">
				<ul>
					<li>이미지는 연출된 것으로, 이미지 내 MD 상품은 실제 판매되지 않습니다.</li>
					<li>해당 음료와 원두는 리저브 매장에서만 판매됩니다.</li>
				</ul>
				<a href="/menu/md">자세히 보기</a>
			</div>
			<img alt="" src="/resources/img/divC_MD.png" id="MD">
		</div>
		<div id="d">
			<a href="service.html"><img alt="" src="/resources/img/divD.png" id="star"></a>
			<div id="Dtextbox">
				<h2>FOUR 커피만의 특별한 혜택, 마이 스타 리워드</h2>
				<p>가까운 매장에서 카드 가입후 리워드 혜택을 즐기세요!</p>
			</div>
		</div>
		<div id="e">
			<img alt="" src="/resources/img/divE_been.png" id="been">
			<div id="Etextbox">
				<h2>르완다 블론드 로스트</h2>
				<p>비옥한 화산, 높은 고도, 풍부한 강우량으로 
				이상적인 풍미를 자랑하는 르완다 블론드 로스트를 즐겨 보세요.
				<br>
				<p>시럽과 같은 부드러운 바디감을 갖고 있어 아이스로도 좋습니다.
				<a href="/menu/roast">자세히 보기</a>
			</div>
		</div>
	
</body>
<%@ include file="../views/includes/footer.jsp"%>