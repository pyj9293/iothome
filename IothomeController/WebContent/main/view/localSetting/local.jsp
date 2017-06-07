<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.iothome.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="dao" class="com.iothome.model.WeatherDAO" />

<%
	ArrayList<WeatherDTO> list = dao.getLocalList();
	WeatherDTO dto = list.get(0);
%>

<!DOCTYPE html>
<div id="local">
	<div class="input-group">
		<input type="text" class="form-control" id="searchKey" 
			placeholder="Search for local"> <span class="input-group-btn">
			<button class="btn btn-default" id="searchBtn" type="button">Search</button>
		</span>
	</div>
</div>