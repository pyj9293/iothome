package com.iothome.main.controller;

import com.iothome.main.socket.CommonWebSocket;
import com.iothome.main.socket.MoodLightJson;

public class MoodLightController {
	private final static String id = "moodlight";
	private CommonWebSocket client;
	private MoodLightJson obj;
	private String jsonKey;

	public MoodLightController() {
		// TODO Auto-generated constructor stub
	}

	

	public void connectWebSocket(String key) { 
		try{
			obj = new MoodLightJson(id, key);
			jsonKey = obj.createJsonObj();
			client = new CommonWebSocket(jsonKey);
			client.connectWebSocket();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}