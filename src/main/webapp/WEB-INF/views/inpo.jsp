<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/includes/header.jsp"%>     
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>서비스 페이지</title>
  
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/subMenu_style.css">
  <link href="/resources/mcss/subMenu_mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
  <link href="/resources/tcss/subMenu_tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">

</head>
<body>
<section >
  	<div id="a">
  			<img alt="" src="/resources/img/subMenu_divA_Coffe.png" id="imgA">
				<div id="Atextbox">
				<h3>음료<span>상품으로 즐거움을 선사해보세요</span></h3>
				<p>독특하고 다양한 상품으로 <br>당신에게 특별한 선물이 될 것입니다.</p>
				<a href="/menu/beverage">자세히 보기</a>
		</div>
	</div>
	
	  <div id="b">
	  		<img alt="" src="/resources/img/subMenu_divB_Muffin.jpg" id="imgB">
		  <div id="Btextbox">
			<h3>푸드<span>간편하지만 든든하게 채워지는 만족감을 느껴보세요</span></h3>
			<p>신선함과 영양이 가득한 푸드 <br>완벽한 하루를 만들어 드립니다.</p>
			<a href="/menu/ food">자세히 보기</a>
		</div>
	</div>	
		  <div id="c">
		  <div id="Ctextbox">
			<h3>원두<span>풍미로 채워지는 만족감을 느껴보세요</span></h3>
			<p>나만의 커피를 만들어보세요  <br>여유로운 한잔을 가져보세요.</p>
			<a href="/menu/roast">자세히 보기</a>
		</div>
	</div>	
		  <div id="d">
		  <img alt="MD" src="/resources/img/submenu_MD.png" id="imgD">
		  <div id="Dtextbox">
			<h3>상품<span>Four커피만의 세상 속 상품</span></h3>
			<p>독특하고 다양한 상품은 <br>당신에게 특별한 선물이 될 것입니다. </p>
			<a href=/menu/md">자세히 보기</a>
		</div>
	</div>
	</section>
  
</body>
</html>

<%@ include file="../views/includes/footer.jsp"%>
