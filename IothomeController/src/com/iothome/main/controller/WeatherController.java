package com.iothome.main.controller;

import java.util.ArrayList;
import org.java_websocket.client.WebSocketClient;
import org.json.JSONObject;

import com.iothome.model.*;
import com.iothome.main.socket.*;

public class WeatherController {
	private final static String id = "weather";
	private ArrayList<WeatherDTO> list;
	private WeatherDAO dao;
	private CommonWebSocket client;
	private WeatherJson obj;
	private String jsonKey;

	public WeatherController() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<WeatherDTO> searchWeatherList(String searchKey) {
		dao = new WeatherDAO();
		if (searchKey != null) {
			try {
				list = dao.searchLocalList(searchKey);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		} else {
			return null;
		}
	}

	public void connectWebSocket(String key) { 
		try{
			obj = new WeatherJson(id, key);
			jsonKey = obj.createJsonObj();
			client = new CommonWebSocket(jsonKey);
			client.connectWebSocket();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}