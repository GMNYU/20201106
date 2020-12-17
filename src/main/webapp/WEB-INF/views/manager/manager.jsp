<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
  	<meta charset="UTF-8">
  	<title>관리자</title>
  	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/manager.css">
	<link href="/resources/mcss/mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
</head>

<style>
	#t1 { width: 877px; height: 500px; top: 68px; display: block;
		 position:relative; left: 173px;
		     margin: 0 auto;
	}
	#t1 th { width: 500px; height: 100px;}
</style>
<body>
<br><br><br><br>
	<div class="title" style="">
		<h2>관리자 모드</h2>
	<form>
	<ul class="titleFrame">
		
		<li id="img1"><img src="/resources/img/beverage/logo_decaf.png"></li>
	</ul>
	</form>
	</div>


	 <table id="t1" border="1">
	<th>수정 홈페이지 바로가기
	<fieldset style = "">
                <legend>홈페이지</legend>
                    <select name = "city2"  style="width: 100px; padding-left: 10px; size = "4" multiple >
                            <option value = "menu" action="/main" >메뉴</option>
                            <option value = "evevt">이벤트</option>
                            <option value = "service">서비스</option>
                            <option value = "login">로그인</option>
                            <option value = "login12">회원가입</option>
                    </select>
                    
                    </fieldset>
	</th>
	<th style="text-align: left;">	
		<li>
		<a href=""><input type = "submit" value = "일반회원" style=" position: relative; margin-left: 25px; top: 1px; "/></a>
	    <a href=""><input type = "submit" value = "정회원" style=" position: relative; margin-left: 28px; top: 1px; "/></a>
	    <a href=""><input type = "submit" value = "관리자" style=" position: relative; margin-left: 28px; top: 1px; "/></a>
	    </li>
	</th>
	<th>
	 		<select name = "city1" size = "4" style="width: 130px;  position:absolute; left: 620px; top: 23px;">
            	<optgroup label = "음료">
                	<option value = "beverage" action="">콜드 브루 커피</option>
                	<option value = "food" action="">에스프레소</option>
              	  <option value = "loast" action="">블렌디드</option>
              	  <option value = "md" action="">소다</option>
               	 <option value = "md" action="">티</option>
                	<option value = "md" action="">기타 제조 음료</option>
                </optgroup>
		  	</select>
	</th>
	<tr><!-- 첫번째 줄 시작 -->
	    <td>
	         <br>
                    상세 수정 <br>
                    <select name = "city1" size = "5" style="width: 100px; padding-left: 10px;">
                        <optgroup label = "메뉴">
                            <option value = "beverage" action="">음료</option>
                            <option value = "food" action="">푸드</option>
                            <option value = "loast" action="">로스트</option>
                            <option value = "md" action="">상품</option>
                        </optgroup>
		  			</select>
		  			<select size = "5" style="width: 130px;">
                         <optgroup label = "이벤트">
                            <option value = "notice" action="">공지사항</option>
                            <option value = "event" action="">이벤트안내</option>
                       </optgroup> 
                    </select>
                    <br>
                    <select size = "5" style="width: 100px;">    
                          <optgroup label = "서비스">
                          <option value = "notice" action="">개발중</option>
                          </optgroup>
                    </select>
                    <select size = "5" style="width: 130px;">      
                           <optgroup label = "로그인">
                            <option value = "login" action="/login/log.jsp">로그인</option>
                            <option value = "login12" action="">회원가입</option>
                        </optgroup>         
                    </select><br>
        <input type = "submit" value = "저장"  />
        <input type = "reset" value = "리셋"  />
	    </td>
	    <td>회원 목록 보여짐</td>
	    <td>
	    	<select size = "4" style="width: 130px;  position:absolute; left: 620px; top: 107px;">
            	<optgroup label = "푸드">
               		<option value = "notice" action="">브레드</option>
                	<option value = "event" action="">케이크</option>
            		<option value = "event" action="">샐러드 & 샌드위치</option>
            		<option value = "event" action="">아이스크림</option>
            	</optgroup>
            </select><br>	 
   			<select size = "4" style="width: 130px; position:absolute; left: 620px; top: 191px;">
            	<optgroup label = "로스트">
               		<option value = "notice" action="">블론드 로스트</option>
              		<option value = "event" action="">미디움 로스트</option>
                	<option value = "event" action="">다크 로스트</option>
                </optgroup> 
            </select><br>
          	<select size = "4" style="width: 130px; position:absolute; left: 620px; top: 274px;">
            	<optgroup label = "상품">
               		<option value = "notice" action="">머그</option>
              		<option value = "event" action="">글라스</option>
                	<option value = "event" action="">텀블러</option>
                </optgroup> 
            </select>  	
		  	
	    </td>
	</tr><!-- 첫번째 줄 끝 -->
	<tr><!-- 두번째 줄 시작 -->
		<td> 2- 1 #개발중# <br><br><br><br><br><br><br><br><br><br></td>
	    <td> 2- 2 #개발중#</td>
	    <td> 2- 3#개발중#</td>
	</tr><!-- 두번째 줄 끝 -->
    </table>
    
</body>

</html>

<%@ include file="../includes/footer.jsp"%>