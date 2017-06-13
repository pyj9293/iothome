package com.iothome.main.socket;

import org.json.*;
public class AlarmJson {
	private String id; //alarm
	private String weekday;
	private String hour;
	private String minute;
	private JSONObject obj;
	
	public AlarmJson(String id, String weekday, String hour, String minute) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.weekday = weekday;
		this.hour = hour;
		this.minute = minute;
	}
	
	public String createJsonObj() {
		obj = new JSONObject();
		obj.put("id",id);
		obj.put("weekday",weekday);
		obj.put("hour",hour);
		obj.put("minute",minute);
		return obj.toString();
	}
	
}
