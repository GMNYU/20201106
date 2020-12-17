<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>스타벅스 공지사항</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/notice_style.css">
<link href="/resources/tcss/notice_tStyle.css"
	media="screen and (min-width: 426px) and (max-width: 768px)"
	rel="stylesheet">
<%@ include file="../includes/header.jsp"%>
</head>
<body>
	<div id="title">
		<h2>
			<img src="/resources/img/title.jpg">
		</h2>
		<button id='regBtn' type="button">글 등록</button>
		
	</div>
	<div id="container">
		<table summary="공지사항" class="notice_tb">
			<caption class="hid">공지사항 번호, 제목, 날짜</caption>
			<colgroup>
				<col width="5.45454%">
				<col width="74.5454%">
				<col width="10.90909%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody class="title1">
				<c:forEach items="${list}" var="NoticeVO">
					<tr>
						<td class="num">${NoticeVO.bno}</td>
						<td class="title_left">
							<a href='/notice/read?bno=<c:out value="${NoticeVO.bno}"/>'>
								<c:out value="${NoticeVO.title}"/></a>
						</td>
						<td class="data"><fmt:formatDate pattern="yyyy/MM/dd"
								value="${NoticeVO.regdate}" /></td>
					</tr>
				</c:forEach>
		</table>
		<div class="pagination">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
		<!-- Modal  추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				  aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			  </div>
			  <div class="modal-body">처리가 완료되었습니다.</div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default"
				  data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			  </div>
			</div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		</div>
		
		
<script type="text/javascript">
  $(document).ready(function() {
	var result = '<c:out value="${result}"/>';
	// result가 empty가 아닐 경우, alert 또는 모달창을 이용해서 result를 보여준다.
	checkModal(result);
	history.replaceState({}, null, null);
	function checkModal(result) {
	  if (result === '' || history.state) {
		return;
	  }
	  if (parseInt(result) > 0) {
		$(".modal-body").html(
		  "게시글 " + parseInt(result)
		  + " 번이 등록되었습니다.");
	  }
	  $("#myModal").modal("show");
	}
	$("#regBtn").on("click", function() {
	  self.location = "/notice/register";
	});
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
	  e.preventDefault();
	  console.log('click');
	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	  actionForm.submit();
	});
	$(".move").on("click", function(e) {
	  e.preventDefault();
	  actionForm.append("<input type='hidden' name='bno' value='"
		+ $(this).attr("href") + "'>");
	  actionForm.attr("action",	"/notice/get");
	  actionForm.submit();
	});

	var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function(e) {
		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
  });
</script>
<%@include file="../includes/footer.jsp"%>