<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

	<footer>
			<ul>
			<li>개인정보 처리방침</li>
			<li>이용 약관</li>
		</ul>
		<ul>
			<li>본사 위치 : </li>
			<li></li>
			<li>대표 번호 : 000-0000-0000</li>
			<li></li>
			<li>사업자 등록 번호 : 000-00-00000</li>
		</ul>
	</footer>
	
	  <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
	
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        $(".sidebar-nav")
        	.attr("class", "sidebar-nav navbar-collapse collapse")
        	.attr("aria-expanded", "false")
        	.attr("style", "height: 1px");
    });
    </script>
	</html> 
	 

