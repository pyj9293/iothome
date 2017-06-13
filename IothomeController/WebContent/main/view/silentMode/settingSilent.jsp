<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="controller"
	class="com.iothome.main.controller.SilentController" />
<%
	String status = request.getParameter("key");
	controller.setSilent(status);
%>