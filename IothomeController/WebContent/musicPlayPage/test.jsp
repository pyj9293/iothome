<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			callAjax();
		});
	});
	function callAjax() {
		var dataString = $("form").serialize(); //파라메터 직렬화 times=10&id= &comment=
		$("div#param").text("parameter:" + dataString); //확인용 화면에 뿌려보자
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/testWeb/test3.jsp",
			data : dataString, //파라메터
			success : whenSuccess, //성공시 callback
			error : whenError //실패시 callback
		});
	}
	function whenSuccess(resdata) {
		var temp = String(resdata);
		if (temp.indexOf("pause") != -1 ) {
			
		} else {
			alert("없어");
		}
	}
	function whenError() {
		alert("Error");
	}
</script>
</head>
</head>
<body>
	전송받은 데이터 :
	<%=request.getParameter("playLink")%><br>
	<iframe width="560" height="315"
		src="https://www.youtube.com/embed/<%=request.getParameter("playLink")%>?autoplay=1"
		frameborder="0" allowfullscreen></iframe>
	<form id="frm">
		<input name="playMsg"  />
		<input id="b1" TYPE="button" value="버튼" />
	</form>
	<div id="ajaxout">ajax리턴값출력</div>
</body>
</html>