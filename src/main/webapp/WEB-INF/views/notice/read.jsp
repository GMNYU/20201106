<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/noticePost_style.css">
<title>스타벅스 공지사항</title>
<%@ include file="../includes/header.jsp"%> 
</head>
<body>
<div id="title">
		<h2>
			<img src="/resources/img/title.jpg">
		</h2>

	<sec:authentication property="principal" var="pinfo"/>
	<sec:authorize access="isAuthenticated()">
		<c:if test="${pinfo.username eq notice.writer}">
			<button data-oper='modify' class="btn btn-default">수정/삭제</button>
		</c:if>
	</sec:authorize>
	<button data-oper='list' class="btn btn-info">목록으로</button>
		
		<form id='operForm' action="/notice/modify" method="get">
  			<input type='hidden' id='bno' name='bno' value='<c:out value="${notice.bno}"/>'>
  			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
		</form>
		
</div>
	<div id="container">
	 <div class="title">
          <label>글번호</label> <input class="form-control" name='bno'
            value='<c:out value="${notice.bno }"/>' readonly="readonly" style=" width: 50%; ">
        </div>
		<div class="title"><label>제목</label>
			<h2><c:out value="${notice.title}"/></h2>
			<p><c:out value="${notice.regdate}"/></p>
		</div>
		<div class="main">
			<p>
			<c:out value="${notice.content}"/>
			</p>
		</div>
		 <div class="title">
          <label>유저</label> <input class="form-control" name='writer'
            value='<c:out value="${notice.writer }"/>' readonly="readonly" style=" width: 50%; ">
        </div>			
	</div>
	
	
	
<%@ include file="../includes/footer.jsp"%>
<script type="text/javascript">

	$(document).ready(function() {
		var operForm = $("#operForm"); 
	  
	  $("button[data-oper='modify']").on("click", function(e){
	    
	    operForm.attr("action","/notice/modify").submit();
	    
	  });
	  
	    
	  $("button[data-oper='list']").on("click", function(e){
	    
	    operForm.find("#bno").remove();
	    operForm.attr("action","/notice/list")
	    operForm.submit();
	    
	  });  
});
</script>