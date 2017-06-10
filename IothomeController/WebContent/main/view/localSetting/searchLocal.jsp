<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.iothome.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="controller"
	class="com.iothome.main.controller.WeatherController" />
<%
	WeatherDTO dto;
	ArrayList<WeatherDTO> list;
	int count;
	try {
		String key = request.getParameter("key");
		list = controller.searchWeatherList(key);
		count = list.size();
%>
<%=count%>,
<%
		for (int i = 0; i < count; i++) {
			dto = list.get(i);
%>
<%=dto.getCity()%>,<%=dto.getNation()%>,
<%
	}

	} catch (Exception e) {
	}
%>
