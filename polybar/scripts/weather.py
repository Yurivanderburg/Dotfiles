import requests
import json
import subprocess


battery_status = subprocess.check_output('cat /sys/class/power_supply/BAT0/status', shell=True).decode('utf-8').split('\n')[0]

if battery_status == 'Discharging':
    display_forecast = True
else: 
    display_forecast = False
    


def main():
    try:

        # Get IP adress
        ip_request = requests.get('https://ipinfo.io/ip')
        ip_adress = ip_request.text
    
        # Get data from weatherapi
        url = (f'https://api.weatherapi.com/v1/current.json?key=ad26958ee93e40f990c154244232806&q={ip_adress}')
        result = requests.get(url)

        if(result.status_code == requests.codes['ok']):
            weather = result.json()
            temp = weather['current']["temp_c"]
            condition = weather['current']['condition']['text']
       
            if not display_forecast:
                return  f"{condition}, {temp}°C"

        else:
            return "API Error"


        # Grab forecast (if wanted)
        if display_forecast:
            url_forecast =  (f'https://api.weatherapi.com/v1/forecast.json?key=ad26958ee93e40f990c154244232806&q={ip_adress}&days=2')
            result_forecast = requests.get(url_forecast)
            if(result_forecast.status_code == requests.codes['ok']):
                weather_forecast = result_forecast.json()
                condition_forecast = weather_forecast['forecast']['forecastday'][1]['day']['condition']['text']
                temp_forecast = weather_forecast['forecast']['forecastday'][1]['day']['maxtemp_c']
                #return f"{condition}, {temp}°C > {condition_forecast}, {temp_forecast}°C"
                return f"{condition}, {temp}°C  >  {temp_forecast}°C"

            else:
                return "API Error" 


    except:
        return "Network Error" 

if __name__ == "__main__":
    print(main())

