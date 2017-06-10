package com.iothome.main.socket;

import org.json.*;
public class MoodLightJson {
	private String id; //moodlight
	private String key;
	private JSONObject obj;
	
	public MoodLightJson(String id, String key) {
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
