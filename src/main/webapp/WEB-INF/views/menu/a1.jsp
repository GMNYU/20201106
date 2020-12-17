<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>음료</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/beverage_style.css">
	<link rel="stylesheet" href="/resources/css/footer_style.css">
	<link href="/resources/mcss/roast_mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
	<link href="/resources/tcss/roast_tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">
	
</head>
<body>

	<section>
		<div id="coldBrewCoffe">
		<div class="title">
			<ul class="titleFrame">
				<li>
					<h2>메 뉴</h2>
				</li>
				<li id="img1"><img src="/resources/img/beverage/logo_decaf.png"></li>
			<!-- 서브 타이틀 -->
			<ul class="smap" >
				<li ><a href="/" ><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로"></a></li>
				<li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
				<li class="en"><a href="/menu/index.do">MENU</a></li>
				<li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
				<li><a href="/menu/drink_list.do" class="this">음료</a></li>
			</ul>
		<!-- 서브 타이틀 end -->
			</ul>
		<div class="list">
		<ul class="thnList">	
			<fieldset><h1>분류 보기</h1>
			<dl class="list-tema">
			<dt class="dt1"><a href="javascript:void(0)" class="selected" 
				role="button" title="카테고리별 음료선택">카테고리</a></dt>
			<dt class="dt2"><a href="javascript:void(0)" title="테마별 음료보기">테마</a></dt>	
			</dl>
			<ul><br><br><br><br><br>
			<li><a href="">
				<input type="checkbox" name="all123" value="a">전체 상품보기
				<input type="checkbox" name="a1" value="a1">콜드 브루 커피
				<input type="checkbox" name="a2" value="a2">브루드 커피
				<input type="checkbox" name="a3" value="a3">에스프레소
				<input type="checkbox" name="a4" value="a4">프라푸치노
				<input type="checkbox" name="a5" value="a5">티(티바나)
				<input type="checkbox" name="a6" value="a6">기타 제조 음료
				</a></li>
				<input type="text">
			</ul>
			</fieldset>
		</ul>
		</div>
		</div>
		</div>
	
 	<div class="list10">
		<table >
		<tr> 
			<c:forEach items="${list}" var="menu" varStatus="status">
			<td><img src="..<c:out value="${menu.menuTbn}"/>.jpg"
				style="padding-right: 10px; padding-bottom: 10px;"/>
			<h2 style="text-align: center; "><c:out value="${menu.menuName}"/></h2></td>
			<c:if test = "${status.count %3 eq 0}">
				<tr>
			</c:if>
			</c:forEach>
		</tr>
		</table>
	</div>

</section>
</body> 
</html>
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
</script>
<script>
function showImage(fileCallPath) {
	//alert(fileCallPath);
	$(".bigPictureWrapper").css("display","flex").show();
	  
	$(".bigPicture")
		.html("<img src='/display?fileName="+ encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height: '100%'}, 1000);
}
	
$(document).ready(function(){
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880;	// 5MB
  
  function checkExtension(filename, filesize) {
	if(filesize > maxSize) {
		alert("파일 크기 초과");
		return false;
	}
	if(regex.test(filename)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
  }
  
  var cloneObj = $(".uploadDiv").clone();
  
  $("#uploadBtn").on("click", function(e){
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	var files = inputFile[0].files;
	console.log(files);
	
	//add filedate to formdata
	for(var i = 0; i < files.length; i++){
	  if(!checkExtension(files[i].name, files[i].size)) {
		  return false;
	  }
	  formData.append("uploadFile", files[i]);
	}
	$.ajax({
	  url: '/uploadAjaxAction',
	  processData: false,
	  contentType: false,
	  data: formData,
	  type: 'POST',
	  dataType: 'json',
	  success: function(result){
	    console.log(result);
	    showUploadedFile(result);
	    $(".uploadDiv").html(cloneObj.html());
	  }
	}); //$.ajax
  });
  
  var uploadResult = $(".uploadResult ul");
  
  function showUploadedFile(uploadResultArr) {
	  var str = "";
	  $(uploadResultArr).each(function(i, obj) {
		  if(!obj.image) {
			  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			  var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
			  str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" +
				"<img src='/resources/img/attach.png'>"	+ obj.fileName + "</a>" +
				"<span data-file=\'" + fileCallPath + "\' data-type='file'> x </span>" +
				"</div></li>";
		  } else {
			  //str += "<li>" + obj.fileName + "</li>";
			  var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +
					obj.uuid + "_" + obj.fileName);
			  var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
			  originPath = originPath.replace(new RegExp(/\\/g), "/");
			  str += "<li><a href=\"javascript:showImage(\'" + originPath +
					"\')\"><img src='/display?fileName=" + fileCallPath + "'></a>" +
					"<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>" +
					"</li>";
		  }
	  });
	  uploadResult.append(str);
  }
  
  $(".uploadResult").on("click","span", function(e){
	var targetFile = $(this).data("file");
	var type = $(this).data("type");
	console.log(targetFile);
	  
	$.ajax({
	    url: '/deleteFile',
	    data: {fileName: targetFile, type:type},
	    dataType:'text',
	    type: 'POST',
	      success: function(result){
	         alert(result);
	      }
	}); //$.ajax  
  });
  
  $(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
//	setTimeout(() => {
//		$(this).hide();
//	}, 1000);
	  
	setTimeout(function() {
	  $(".bigPictureWrapper").hide();
	}, 1000);
  });
});
</script>
	<%@ include file="../includes/footer.jsp"%>