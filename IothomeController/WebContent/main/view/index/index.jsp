<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IotHome</title>

<!-- index -->
<link rel="stylesheet" type="text/css" href="normalize.css">
<link rel="stylesheet" type="text/css" href="indexStylesheet.css">
<script type="text/javascript" src="../../index/indexJavaScript.js"></script>

<!-- bootstrap -->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:useBean id="test" class="com.iothome.test.Test" scope="page"></jsp:useBean>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<div id="title-div">
		<h1>iotHome</h1>
		<h4>당신만을 위한 iotHome으로 편안한 라이프 스타일을 즐겨보세요</h4>
	</div>

	<div class="row" id="content-button">
		<div class="col-xs-6 col-md-3">
			<a href="#" class="thumbnail"> <img src="http://placehold.it/250x250">
			</a>
		</div>
		
		<div class="col-xs-6 col-md-3">
			<a href="#" class="thumbnail"> <img src="http://placehold.it/250x250">
			</a>
		</div>
		
		<div class="col-xs-6 col-md-3">
			<a href="#" class="thumbnail"> <img src="http://placehold.it/250x250">
			</a>
		</div>
		
		<div class="col-xs-6 col-md-3">
			<a href="#" class="thumbnail"> <img src="http://placehold.it/250x250">
			</a>
		</div>
	</div>
	
	<div class="calender">
		<iframe id="calendar-frame" src="../calendar/html/selectable.html" frameborder=0 scrolling=no></iframe>
	</div>

	<div class="row" id="setting">
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
		<div class="col-sm-6 col-md-4" id="setting-list">
			<a href="#" class="thumbnail"> 
				<div class="caption">
					<img src="http://placehold.it/80x80">
					<h3>Wifi</h3>
				</div>
			</a>
		</div>
	</div>
	<p> 테스트 메세지 출력 = <%=test.getTestingStr()%> </p>
</body>
</html>