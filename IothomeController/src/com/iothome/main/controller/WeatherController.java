package com.iothome.main.controller;

import java.util.ArrayList;

import com.iothome.model.*;

public class WeatherController {
	private ArrayList<WeatherDTO> list;
	private WeatherDAO dao;
	private String searchKey;

	public WeatherController() {
		// TODO Auto-generated constructor stub
		dao = new WeatherDAO();
	}

	public ArrayList<WeatherDTO> searchWeatherList(String searchKey){
		this.searchKey = searchKey;
		if(searchKey != null) {
			System.out.println(searchKey);
			try{
				list = dao.searchLocalList(searchKey);				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		} else {
			return null;
		}
	}
}