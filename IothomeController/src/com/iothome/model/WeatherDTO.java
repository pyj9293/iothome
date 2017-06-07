package com.iothome.model;

public class WeatherDTO {
	private int id;
	private String city;
	private String nation;

	public WeatherDTO() {

	}

	public WeatherDTO(int local_id, String city, String nation) {
		this.id = local_id;
		this.city = city;
		this.nation = nation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}
	
	
}
