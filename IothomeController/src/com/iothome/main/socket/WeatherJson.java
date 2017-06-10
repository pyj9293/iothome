package com.iothome.main.socket;

import org.json.*;
public class WeatherJson {
	private String id;
	private String key;
	private int count;
	private JSONObject obj;
	
	public WeatherJson(String id, String key) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.key = key;
	}
	
	public String createJsonObj() {
		obj = new JSONObject();
		obj.put("id",id);
		obj.put("key",key);
		return obj.toString();
	}
	
}
