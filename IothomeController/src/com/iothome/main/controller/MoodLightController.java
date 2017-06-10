package com.iothome.main.controller;

import java.util.ArrayList;
import org.java_websocket.client.WebSocketClient;
import org.json.JSONObject;

import com.iothome.model.*;
import com.iothome.main.socket.*;

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