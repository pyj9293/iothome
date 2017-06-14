package com.iothome.main.controller;

import java.util.ArrayList;

import com.iothome.model.LocalDictionary;
import com.iothome.model.WeatherDAO;
import com.iothome.model.WeatherDTO;

public class WeatherController {
	private ArrayList<WeatherDTO> list;
	private WeatherDAO dao;
	private LocalDictionary dic;
	public WeatherController() {
		// TODO Auto-generated constructor stub
		dao = new WeatherDAO();
	}

	public ArrayList<WeatherDTO> searchWeatherList(String searchKey) {
		if (searchKey != null) {
			try {
				list = dao.searchLocalList(searchKey);
				dic = new LocalDictionary(list);
				list = dic.toKorean();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		} else {
			return null;
		}
	}

	public boolean settingWeatherLocal(WeatherDTO dto) {
		if (dto.getCity() != null ) {
			try {
				dao.getLocal(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		} else {
			return false;
		} 
	}
}