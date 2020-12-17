<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://
www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>로그인 페이지</title>
	<meta http-equiv="Content-Type" content="text/html; chart=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/login.css">
	<link rel="stylesheet" href="/resources/css/login2.css">
	<link rel="stylesheet" href="/resources/css/subMenu_style.css">
	<link href="/resources/mcss/mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
	
</head>

    <body>
         <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">로그인</button>
                    <button type="button" class="togglebtn" onclick="register()">회원가입</button>
                </div>
                <div class="social-icons">
                    <img src="/resources/img/logo.png">
                    <a href="/..Main">Main</a> <!-- css 해야함 -->
                </div>
                <form method="post" id="login" action="/login" class="input-group">
                    <input type="text" name='username'  class="input-field" placeholder="아이디" required>
                    <input type='password' name='password'  class="input-field" placeholder="비밀번호" required>
                    <input type="checkbox" name='remember-me' class="checkbox"><span>자동 로그인 설정</span>
                    <button class="submit">로그인</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
                <form id="register" action="/member/join" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디를 입력하세요" required>
                    <input type="text" class="input-field" placeholder="이름을 입력하세요" required>
                    <input type="password" class="input-field" placeholder="비밀번호를 입력하세요" required>
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit">회원가입</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>    
        
    </body>
</html> 
<%-- 	<%@ include file="../includes/footer.jsp"%>    --%>
