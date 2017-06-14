package com.iothome.model;

import java.util.ArrayList;

public class LocalDictionary {
	private ArrayList<WeatherDTO> list;
	String[][] dicArr = {
			{"Busan","부산"},{"Daegu","대구"},{"Ulsan","울산"},{"Wonju","원주"},{"Masan","마산"},{"Chinju","진주"},{"Gwangju","광주"},
			{"Jeju","제주"},{"Chuncheon","춘천"},{"Hoko","포항"},{"Tenan","천안"},{"Kunsan","군산"},{"Moppo","목포"},{"Jeonju","전주"},
			{"Reisui","여수"},{"Sogcho","속초"},{"Kang-neung","강릉"},{"Sunchun","순천"},{"Kyonju","경주"},{"Santyoku","삼척"},
			{"Yeoju","여주"},{"Vijongbu","의정부"},{"Daejeon","대전"},{"Suigen","수원"},{"Seoul","서울"},{"Kwangju","광주"},
			{"Incheon","인천"},{"Changwon","창원"},{"Tonghae","동해"}
	};
	public LocalDictionary(ArrayList<WeatherDTO> list) {
		// TODO Auto-generated constructor stub
		this.list = list;
	}
	public ArrayList<WeatherDTO> toKorean() {
		String temp;
		ArrayList<WeatherDTO> tlist = new ArrayList<WeatherDTO>();
		for(int i = 0; i < list.size(); i++) {
			temp = list.get(i).getCity();
			for(int j = 0; j < dicArr.length; j++) {
				if(temp.equals(dicArr[j][0])) {
					WeatherDTO dto = new WeatherDTO();
					System.out.println(dicArr[j][1]);
					dto.setCity(dicArr[j][1]);
					dto.setNation(list.get(i).getNation());
					tlist.add(dto);
					break;
				}
			}
		}
		
		System.out.println(tlist.get(1).getCity() + tlist.get(1).getNation());
		return tlist;
	}
}
