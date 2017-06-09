<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" language="java" import="java.sql.*" import="java.util.*"%>
<%@ page import= "com.iothome.model.*"%>
<jsp:useBean id="dao" class="com.iothome.model.AlarmDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
int i;
int count = dao.count();
int hour = 0;
ArrayList<AlarmDTO> alist = dao.getMemberList();
%>
<html>
<body>
<div id="alam">
	<table id="alamList" class="table table-hover">
	<%
	 if(count == 0) { %>
		<tr><td colspan=4>등록된 알람이 없습니다!.</td></tr>
<% } else {
	for(i=0; i<count; i++) {
		AlarmDTO dto = alist.get(i);
		hour = dto.getHour();
		out.println("<tr>");
		if(hour > 12) {
			out.println("<td style=\"vertical-align: middle; text-align: right;\"><p class=\"ampm\">오후</p></td>");
			hour -= 12;
		} else {
			out.println("<td style=\"vertical-align: middle; text-align: right;\"><p class=\"ampm\">오전</p></td>");
		}
		out.println("<td style=\"vertical-align: middle; text-align: right;\"><p class=\"ampm\">" + dto.getWeekday() + "</p></td>");
		out.println("<td><p class=\"time\" style=\"font-size: 45px; font-weight: bold;\">" + hour + ":" +dto.getMinute()+ "</p></td>");
		out.println("<td style=\"vertical-align: middle; text-align: left; padding-top: 0;\"><img class=\"delete\" src=\"../../resource/delete.png\"/ style=\"width: 30px; vertical-align: bottom; text-align: right;\"></td>");
	}
}
%>
	</table>
</div>
</body>
</html>