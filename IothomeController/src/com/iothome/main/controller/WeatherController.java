package com.iothome.main.controller;

import java.util.ArrayList;
import org.java_websocket.client.WebSocketClient;
import org.json.JSONObject;

import com.iothome.model.*;
import com.iothome.main.socket.*;

public class WeatherController {
	private ArrayList<WeatherDTO> list;
	private WeatherDAO dao;
	private CommonWebSocket client;
	private WeatherJson obj;
	private String jsonKey;

	public WeatherController() {
		// TODO Auto-generated constructor stub
		dao = new WeatherDAO();
	}

	public ArrayList<WeatherDTO> searchWeatherList(String searchKey) {
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

	public boolean settingWeatherLocal(String[] key) {
		if (key != null) {
			try {
				dao.getLocal(key);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		} else {
			return false;
		} 
	}
}