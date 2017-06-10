<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" language="java" import="java.sql.*"
	import="java.util.*"%>
<%@ page import="com.iothome.model.*"%>
<jsp:useBean id="dao" class="com.iothome.model.EnvironmentDAO" />
<jsp:useBean id="controller"
	class="com.iothome.main.controller.EnvironmentController" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="thinfo">

	<%
		ArrayList<EnvironmentDTO> alist = dao.getMemberList();
		ArrayList<EnvironmentDTO> alist1 = dao.getMemberList1();
		EnvironmentDTO dto = alist.get(0);
		EnvironmentDTO dto1 = alist1.get(0);
	%>

	<script>
		function insertEnvironment() {
			var hightemp = $("#hightemp").val();
			var lowtemp = $("#lowtemp").val();
			var highhumi = $("#highhumi").val();
			var lowhumi = $("#lowhumi").val();
			$.ajax({
				type : "post",
				url : '../environmental/environmental.jsp',
				data : {
					htkey : hightemp,
					ltkey : lowtemp,
					hhkey : highhumi,
					lhkey : lowhumi
				},
				success : function() {
					alert("변경되었습니다.");
					location.reload();

				},
				error : whenError,

			});

		}
	</script>

	<%
		try {
			int htkey = Integer.parseInt(request.getParameter("htkey"));
			int ltkey = Integer.parseInt(request.getParameter("ltkey"));
			int hhkey = Integer.parseInt(request.getParameter("hhkey"));
			int lhkey = Integer.parseInt(request.getParameter("lhkey"));
			controller.insertEnvironment(htkey, ltkey, hhkey, lhkey);
		} catch (Exception e) {
		}
	%>

	<button id="environmental-refresh" onClick="refresh()"></button>

	<div class="rt-info" id="temperature">

		<h2>현재 온도</h2>
		<p id="temperature-num"><%=dto.getTemp()%></p>
		<div class="progress">
			<div id="temperature-bar" class="progress-bar progress-bar-success"
				role="progressbar" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="50"></div>
		</div>
	</div>
	<div class="rt-info" id="humidity">
		<h2>현재 습도</h2>
		<p id="humidity-num"><%=dto.getHumi()%></p>
		<div class="progress">
			<div id="humidity-bar" class="progress-bar progress-bar-info"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100" style="width: 99%"></div>
		</div>
	</div>

	<p id="environmental-text" class="bg-success">원하는 온도를 설정할 수 있습니다.</p>


	<table id="environmental-table" class="table table-hover">
		<tr>
			<td class="left">설정할 최대온도:</td>
			<td class="right"><input type="text" id="hightemp"
				name="hightemp" placeholder="현재 설정 : <%=dto1.getHighTemp()%>˚C"></td>
		</tr>
		<tr>
			<td class="left">설정할 최저온도:</td>
			<td class="right"><input type="text" id="lowtemp" name="lowtemp"
				placeholder="현재 설정 : <%=dto1.getLowTemp()%>˚C"></td>
		</tr>
		<tr>
			<td class="left">설정할 최대습도:</td>
			<td class="right"><input type="text" id="highhumi"
				name="highhumi" placeholder="현재 설정 : <%=dto1.getHighHumi()%>%"></td>
		</tr>
		<tr>
			<td class="left">설정할 최대습도:</td>
			<td class="right"><input type="text" id="lowhumi" name="lowhumi"
				placeholder="현재 설정 : <%=dto1.getLowHumi()%>%"></td>
		</tr>
	</table>
	<p id="environmental-warning" class="bg-warning">실내 적정 온도는 약 18도에서
		20도 이며, 실내 적정 습도는 70%입니다.</p>
	<input id="environmental-submit" onClick="insertEnvironment()"
		class="btn btn-success" type="submit" value="변경">

</div>
