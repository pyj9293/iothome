		package com.iothome.model;

		public class EnvironmentDTO {
			private float temp;
			private float humi;
			private String hightemp;
			private String lowtemp;
			private String highhumi;
			private String lowhumi;


			public EnvironmentDTO() {

			}

			public EnvironmentDTO(float temp, float humi,String hightemp,String lowtemp,String highhumi , String lowhumi) {
				this.temp = temp;
				this.humi = humi;
				this.hightemp = hightemp;
				this.lowtemp = lowtemp;
				this.highhumi = highhumi;
				this.lowhumi = lowhumi;
			}

			public float getTemp() {
				return temp;
			}

			public void setTemp(float temp) {
				this.temp = temp;
			}

			public float getHumi() {
				return humi;
			}

			public void setHumi(float humi) {
				this.humi = humi;
			}

			public String getHighHumi() {
				return highhumi;
			}

			public void setHighHumi(String highhumi) {
				this.highhumi = highhumi;
			}

			public String getLowHumi() {
				return lowhumi;
			}

			public void setLowHumi(String lowhumi) {
				this.lowhumi = lowhumi;
			}

			public String getHighTemp() {
				return hightemp;
			}

			public void setHighTemp(String hightemp) {
				this.hightemp = hightemp;
			}

			public String getLowTemp() {
				return lowtemp;
			}

			public void setLowTemp(String lowtemp) {
				this.lowtemp=lowtemp;
			}
			
			
		}