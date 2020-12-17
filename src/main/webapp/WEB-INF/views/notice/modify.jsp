<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%-- <%@ include file="../includes/header.jsp"%>  --%>
<head>
<title>글 수정/삭제</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/noticePost_style.css">

</head>

  	<div class="col-lg-12">
	<div id="wrapper">
	<form role="form" action="/notice/modify" method="post">
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
	<div class="form-group">
		<label>글번호</label> 
  		<input class="form-control" name='bno' 
     	value='<c:out value="${notice.bno }"/>' readonly="readonly" style=" width: 50%;">
	</div>	
	<div class="form-group"><label>제목</label>
		<input name='title' value='<c:out value="${notice.title }"/>'
		  type="text" class="form-control" placeholder="제목" 
		  maxlength="50" style=" width: 50%;"/>
	</div>
    <div class="form-group"><label>내용</label>
        <textarea name='content' class="form-control" placeholder="내용" 
        	maxlength="2048" style="height: 350px;  width: 50%;">
        <c:out value="${notice.content}"/></textarea>
    </div>
     <div class="form-group" ><label>유저</label>
            <input name='writer' type="text" class="form-control" 
            value='<c:out value="${notice.writer}"/>' readonly="readonly"
            style=" width: 50%; ">
            
    </div>
	<div class="form-group">
  		<label>RegDate</label> 
  		<input class="form-control" name='regDate'
    	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.regdate}" />'  
    		readonly="readonly" style=" width: 50%; ">            
	</div>

	<div class="form-group">
  	<label>Update Date</label> 
  		<input class="form-control" name='updateDate'
    	value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.updatedate}" />'  
    		readonly="readonly" style=" width: 50%; ">            
	</div>

<div class="row" style=" width: 50%; ">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">Files</div><!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple="multiple">
        </div>
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div><!--  end panel-body -->
    </div><!--  end panel-body -->
  </div><!-- end panel -->
</div><!-- /.row -->

  
<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username eq notice.writer}">
  		<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
  		<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
  	</c:if>
</sec:authorize>
	<button type="submit" data-oper='list' class="btn btn-info">List</button>
		
</form>
</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
	  var formObj = $("form");
	  $('button').on("click", function(e){
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/notice/remove");
	      
	    }else if(operation === 'list'){
	      formObj.attr("action", "/notice/list").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });

});
</script>

<%@ include file="../includes/footer.jsp"%>