package com.iothome.main.socket;

import org.json.JSONObject;
public class SilentJson {
	private String id;
	private String key;
	private JSONObject obj;
	
	public SilentJson(String id, String key) {
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
