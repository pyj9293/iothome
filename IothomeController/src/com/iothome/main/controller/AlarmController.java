package com.iothome.main.controller;

import java.util.ArrayList;

import com.iothome.main.socket.AlarmJson;
import com.iothome.main.socket.CommonWebSocket;
import com.iothome.model.*;

public class AlarmController {
	private int index;
	private AlarmDAO dao;
	private int alarmKey;
	private final static String id = "alarm";
	private CommonWebSocket client;
	private AlarmJson obj;
	private String jsonKey;

	public AlarmController() {
		// TODO Auto-generated constructor stub
		dao = new AlarmDAO();
	}

	public int deleteAlarmList(int alarmKey){
		this.alarmKey = alarmKey;
		try{
			int alamrkey = dao.deleteAlarm(alarmKey);	
			System.out.println("컨트롤러 들어옴");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return alarmKey;
	}
	
	public void connectWebSocket(String weekday, String hour, String minute) { 
		try{
			obj = new AlarmJson(id, weekday, hour, minute);
			jsonKey = obj.createJsonObj();
			client = new CommonWebSocket(jsonKey);
			client.connectWebSocket();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}