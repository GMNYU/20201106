<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>

	<link rel="stylesheet" href="/resources/css/style.css">
	<link href="/resources/mcss/mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
 
</head>

  <div id="wrap">
    <header>
      <div class="menubar">
        <h1 class="logo"><a href="/main">FOUR커피</a></h1>

   		<nav>
					<ul class="gnb clearfix">
						<li><a href="/menu">메뉴</a>
							<ul class="menu1">
								<li><a href="/menu/beverage">음료</a></li>
								<li><a href="/menu/food">푸드</a></li>
								<li><a href="/menu/roast">로스트</a></li>
								<li><a href="/menu/md">상품</a></li>
								<li><a href="/menu/a1">분류</a></li>
							</ul>
						</li>
						<li><a href="/inpo">이벤트</a>
							<ul class="menu2">
								<li><a href="/event/notice">공지사항</a></li>
								<li><a href="/notice/list">게시판</a></li>
								<li><a href="/event/event">이벤트 안내</a></li>
							</ul>
						</li>
						<li>
						<a href="/service">서비스</a>
						</li>
						<li><a href="/login/log">로그인</a>
							<ul class="menu1">
								<li><a href="/login/log">로그인</a></li>
								<li><a href="/member/join">회원가입</a></li>
								<li><a href="/manager/manager">관리자</a></li>

							</ul>
						</li>
					</ul>
				</nav>
  		</div>
	
	</header>
	</div>
</html>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/resources/js/jquery.min.js"></script>