package com.iothome.main.controller;

import com.iothome.main.socket.CommonWebSocket;
import com.iothome.main.socket.SilentJson;

public class SilentController {
	private final static String id = "silent";
	private CommonWebSocket client;
	private SilentJson obj;
	private String jsonKey;
	
	public void setSilent(String key) {
		try {
			obj = new SilentJson(id, key);
			jsonKey = obj.createJsonObj();
			client = new CommonWebSocket(jsonKey);
			client.connectWebSocket();			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}