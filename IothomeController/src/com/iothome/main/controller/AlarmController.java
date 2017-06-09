package com.iothome.main.controller;

import java.util.ArrayList;

import com.iothome.model.*;

public class AlarmController {
	private int index;
	private AlarmDAO dao;
	private int alarmKey;

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
}