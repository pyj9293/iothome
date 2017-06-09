package com.iothome.model;

public class AlarmDTO {
	private String weekday;
	private int hour;
	private String minute;

	public AlarmDTO() {

	}

	public AlarmDTO(String weekday, int hour, String minute) {
		this.weekday = weekday;
		this.hour = hour;
		this.minute = minute;
	}

	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}
	
	
}