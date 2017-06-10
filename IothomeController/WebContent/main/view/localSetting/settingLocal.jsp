<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="com.iothome.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="controller"
	class="com.iothome.main.controller.WeatherController" />
<%
	int count;
	String key = request.getParameter("key");
	String temp = key.replace(" ", ",");
	String[] value = temp.split(",");
	boolean result;
	try {
		result = controller.settingWeatherLocal(value);
		%><%=result%><%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
