<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.iothome.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="controller"
	class="com.iothome.main.controller.WeatherController" />

<%
	WeatherDTO dto = null;
	try {
		String key = request.getParameter("key");
		ArrayList<WeatherDTO> list = controller.searchWeatherList(key);
		dto = list.get(0);
	} catch (Exception e) {
	}
%>

<div id="local">
	<div class="input-group">
		<input type="text" class="form-control" id="searchKey"
			placeholder="Search for local" name="key"> <span
			class="input-group-btn">
			<button class="btn btn-default" id="searchBtn" type="button">Search</button>
		</span>
	</div>
</div>
	
	
	<% if(dto == null){ %>
	<% } else {%>
	<div>
		<ul class="list-group">
			<%for(int i=0; i < 1; i++) { %>
			<li class="list-group-item">
				<a onclick="settinglocal()" href="#"><%=dto.getCity() %></a>
			</li>
			<%}%>
		</ul>
	</div>
	<%}%>