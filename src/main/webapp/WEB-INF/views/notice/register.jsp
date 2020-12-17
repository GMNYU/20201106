<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <%@ include file="../includes/header.jsp"%>   --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글 쓰기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/noticePost_style.css">

</head>
<body>
	<form role="form" action="/notice/register" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group" style=""><label>제목</label>
		  <input name='title' type="text" class="form-control" placeholder="제목" maxlength="50" 
		  		style=" width: 50%;"/>
          </div>
          <div class="form-group" ><label>내용</label>
            <textarea name='content' class="form-control" placeholder="내용" maxlength="2048" 
            	style="height: 250px; width: 50%; "></textarea>
           </div>
            <div class="form-group" ><label>write</label>
            <input name='writer' type="text" class="form-control" style=" width: 50%; ">
           </div>
           <div>
        	  <button type="submit">전송</button>
        	  <button type="reset">초기화</button>
          </div>
	</form>
	
<!-- 	<div class="panel panel-default">
    	<div class="panel-heading">File Attach</div>/.panel-heading
		<div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple>
        </div>
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div> end panel-body
    </div> end panel-body
         -->   
<script>

$(document).ready(function(e){
  var formObj = $("form[role='form']");
  $("button[type='submit']").on("click", function(e){    
    e.preventDefault();
    console.log("submit clicked");
	var str = "";
    $(".uploadResult ul li").each(function(i, obj){
      var jobj = $(obj);
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
    });
    console.log(str);
    formObj.append(str).submit();
  });
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  var csrfHeaderName = "${_csrf.parameterName}";
  var csrfTokenValue = "${_csrf.token}";
  
  $("input[type='file']").change(function(e){
    var formData = new FormData();
    var inputFile = $("input[name='uploadFile']");
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){
      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,
      beforeSend: function(xhr) {
    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      },
      data: formData,
      type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
  });
  
  function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	var uploadUL = $(".uploadResult ul");
	var str ="";
	    
	$(uploadResultArr).each(function(i, obj){
	  if(obj.image){
		var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		str += "<li data-path='"+obj.uploadPath+"'";
		str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
		str +" ><div>";
		str += "<span> "+ obj.fileName+"</span>";
		str += "<button type='button' data-file=\'"+fileCallPath+"\' "
		str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		str += "<img src='/display?fileName="+fileCallPath+"'>";
		str += "</div>";
		str +"</li>";
	  }else{
		var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		str += "<li "
		str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
		str += "<span> "+ obj.fileName+"</span>";
		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
		str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		str += "<img src='/resources/img/attach.png'></a>";
		str += "</div>";
		str +"</li>";
	  }
	});    
	uploadUL.append(str);
  }
  

  $(".uploadResult").on("click", "button", function(e){
	console.log("delete file");
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    var targetLi = $(this).closest("li");
	$.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      dataType:'text',
      beforeSend: function(xhr) {
    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      },
      type: 'POST',
      success: function(result){
	    alert(result);
        targetLi.remove();
      }
    }); //$.ajax
  });
});
</script>
<%@ include file="../includes/footer.jsp"%>