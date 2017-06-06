<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
		<button id="environmental-refresh"></button>
		<div class="rt-info" id="temperature">
			<h2>현재 온도</h2>
			<p id="temperature-num">45</p>
			<div class="progress">
				<div id="temperature-bar" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="50">
				</div>
			</div>
		</div>
		<div class="rt-info" id="humidity">
			<h2>현재 습도</h2>
			<p id="humidity-num">45</p>
			<div class="progress">
		  		<div id="humidity-bar" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 99%">
		  		</div>
			</div>
		</div>
		
		<p id="environmental-text" class="bg-success">원하는 온도를 설정할 수 있습니다.</p>
		
		<form method="post" action="index.jsp">
			<table id="environmental-table" class="table table-hover">
				<tr>
					<td class="left">설정할 온도: </td>
					<td class="right"><input type="text" name="temperature"></td>
				</tr>
				<tr>
					<td class="left">설정할 습도: </td>
					<td class="right"><input type="text" name="humidity"></td>
				</tr>
			</table>
			<p id="environmental-warning" class="bg-warning">
		    	실내 적정 온도는 약 18도에서 20도 이며, 실내 적정 습도는 70%입니다.
		    </p>
			<input id="environmental-submit" class="btn btn-success" type="submit" value="변경">
		</form>