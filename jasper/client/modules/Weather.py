# -*- coding: utf-8-*-

import re
import pyowm
from semantic.numbers import NumberService

WORDS = ["날씨"]
PRIORITY = 4

cityDict = {	'Ulsan' : '울산',
		'Busan' : '부산',
		'Daegu' : '대구',
		'Wonju' : '원주',
		'Masan' : '마산',
		'Chinju' : '진주',
                'Gwangju' : '광주',
                'Jeju' : '제주',
                'Chuncheon' : '춘천',
                'Hoko' : '포항',
                'Tenan' : '천안',
                'Kunsan' : '군산',
                'Moppo' : '목포',
                'Jeonju' : '전주',
                'Reisui' : '여수',
                'Sogcho' : '속초',
                'Kang-neung' : '강릉',
                'Sunchun' : '순천',
                'Kyonju' : '경주',
                'Santyoku' : '삼척',
                'Yeoju' : '여주',
                'Vijongbu' : '의정부',
                'Daejeon' : '대전',
                'Suigen' : '수원',
                'Seoul' : '서울',
                'Kwangju' : '광주',
                'Incheon' : '인천',
                'Changwon' : '창원',
                'Tonghae' : '동해'}

weatherStatus = {	'' : ''
		}

def handle(text, mic, profile):

    serviceNum = NumberService()

    def formatTimeStamp(unix_time):
        return datetime.fromtimestamp(unix_time).strftime("%B %d")

    def getWeeklyWeatherReport(forecast,loc,temp_unit='celsius',report='current'):
        weather_report = "Weather forecast for next week at "+loc +". "
        rainy_days = len(forecast.when_rain())
        if rainy_days > 0:
            rainy_days_str = "Rainy Days are. "
            for d in range(rainy_days):
                rain_day = forecast.when_rain()[d].get_reference_time()
                date_str = formatTimeStamp(rain_day)
                rainy_days_str += date_str + ". "

            weather_report += rainy_days_str
            date_str = ''
        
        most_rainy = forecast.most_rainy()
        if most_rainy:
            weather_report += "You will observe heavy rain on. "
            ref_time = most_rainy.get_reference_time()
            date_str = formatTimeStamp(ref_time)
            weather_report += date_str + ". "
            date_str = ''
            
        sunny_days = len(forecast.when_sun())
        if sunny_days > 0:
            sunny_days_str = "Sunny Days are. "
            for d in range(sunny_days):
                sunny_day = forecast.when_rain()[d].get_reference_time()
                date_str = formatTimeStamp(sunny_day)
                sunny_days_str += date_str + ". "

            weather_report += sunny_days_str
            date_str = ''
        
        most_hot = forecast.most_hot()
        if most_hot:
            weather_report += "You will feel heat on. "
            ref_time = most_hot.get_reference_time()
            date_str = formatTimeStamp(ref_time)
            weather_report += date_str + ". "
            date_str = ''
            
        most_windy = forecast.most_windy()
        if most_windy:
            weather_report += "Most windy day will be. "
            ref_time = most_windy.get_reference_time()
            date_str = formatTimeStamp(ref_time)
            weather_report += date_str + ". "
            date_str = ''
            
        most_humid = forecast.most_humid()
        if most_humid:
            weather_report += "Most humid day will be. "
            ref_time = most_humid.get_reference_time()
            date_str = formatTimeStamp(ref_time)
            weather_report += date_str + ". "
            date_str = ''

        most_cold = forecast.most_cold()
        if most_cold:
            weather_report += "Coolest day will be. "
            ref_time = most_cold.get_reference_time()
            date_str = formatTimeStamp(ref_time)
            weather_report += date_str + ". "
            date_str = ''
            
        return weather_report

    def getWeatherReport(weather,loc,temp_unit='celsius',report='current'):

	weather_report = 'Server Down.'
        wind = weather.get_wind()
        wind_speed = serviceNum.parseMagnitude(wind["speed"])
        humi = serviceNum.parseMagnitude(weather.get_humidity())
        clou = serviceNum.parseMagnitude(weather.get_clouds())
        stat = weather.get_status()
        detstat = weather.get_detailed_status()

        if report == 'current':
            temp = weather.get_temperature(temp_unit)
            temp_max = serviceNum.parseMagnitude(temp['temp_max'])
            temp_min = serviceNum.parseMagnitude(temp['temp_min'])
            curr_temp = serviceNum.parseMagnitude(temp['temp'])
            weather_report = cityDict[str(loc)]+" 지역 날씨 입니다. 오늘은 "+str(stat)+" 입 니다. There is a chance of "  \
                            +str(detstat)+". 현재 온도는 "+ curr_temp +" 도 입 니다. 습도는 "  \
                            +humi+" % 이고. 풍속은 "  \
                            +wind_speed+" 미터퍼세크 입니다."

        elif report == 'tommorow':
            temp = weather.get_temperature(temp_unit)
            temp_morn = serviceNum.parseMagnitude(temp['morn'])
            temp_day = serviceNum.parseMagnitude(temp['day'])
            temp_night = serviceNum.parseMagnitude(temp['night'])
            weather_report = "Weather at "+loc+". Tomorrow will be "+stat+". There will be a chance of "  \
                              +detstat+". Temperature in the morning "+temp_morn+" degree "  \
                              +temp_unit+". Days Temperature will be "+temp_day+" degree "  \
                              +temp_unit+". and Temperature at night will be "+temp_night+" degree "  \
                              +temp_unit+". Humidity "+humi+" percent. Wind Speed "  \
                              +wind_speed+". with clouds cover "+clou+" percent."

        return weather_report

    if 'OpenWeatherMap' in profile:
        if 'api_key' in profile['OpenWeatherMap']:
            api_key = profile['OpenWeatherMap']['api_key']
        if 'city_name' in profile['OpenWeatherMap']:
            city_name = profile['OpenWeatherMap']['city_name']
        if 'country' in profile['OpenWeatherMap']:
            country = profile['OpenWeatherMap']['country']
        if 'temp_unit' in profile['OpenWeatherMap']:
            temp_unit = profile['OpenWeatherMap']['temp_unit']

    owm = pyowm.OWM(api_key)

    if re.search(ur'날씨|현재|오늘|오늘의',text,re.IGNORECASE):
        cw = owm.weather_at_place(city_name+","+country)
        loc = cw.get_location().get_name()
        weather = cw.get_weather()
        weather_report = getWeatherReport(weather,loc,temp_unit,report='current')
        mic.say(weather_report)

    elif re.search(ur'내일의|내일',text,re.IGNORECASE):
        forecast = owm.daily_forecast(city_name)
        fore = forecast.get_forecast()
        loc = fore.get_location().get_name()
        tomorrow = pyowm.timeutils.tomorrow()
        weather = forecast.get_weather_at(tomorrow)
        weather_report = getWeatherReport(weather,loc,temp_unit,report='tommorow')
        mic.say(weather_report)

def isValid(text):
   return bool(re.search(ur'날씨',text,re.IGNORECASE))
   # return any(word in text.upper() for word in WORDS)

