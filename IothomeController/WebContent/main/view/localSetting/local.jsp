<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.iothome.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="controller" class="com.iothome.main.controller.WeatherController" />

<%
	try {
		String key = request.getParameter("key");
		ArrayList<WeatherDTO> list = controller.searchWeatherList(key);
	}catch(Exception e) {
		e.printStackTrace();
	}
%>

<div id="local">
	<div class="input-group">
		<input type="text" class="form-control" id="searchKey" 
			placeholder="Search for local" name="key"> <span class="input-group-btn">
			<button class="btn btn-default" id="searchBtn" type="button">Search</button>
		</span>
	</div>
</div>