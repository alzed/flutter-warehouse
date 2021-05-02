import 'location.dart';
import 'weather.dart';

class Forecast {
  Forecast({this.location});
  String location;

  Future<dynamic> getData() async {
    dynamic data;
    if (this.location == null) {
      var position = await Location().getLocation();

      data = await Weather().getWeather(position.latitude, position.longitude);
    } else {
      data = await Weather().getWeatherLocation(this.location);
    }
    Map<String, String> weatherData = {
      'location': data['data'][0]['city_name'],
      'local_time': data['data'][0]['ob_time'],
      'description': data['data'][0]['weather']['description'],
      'temperature': data['data'][0]['temp'].toString(),
      'feels_like': data['data'][0]['app_temp'].toString(),
      'wind_speed': data['data'][0]['wind_spd'].toStringAsFixed(2),
      'humidity': data['data'][0]['rh'].toStringAsFixed(2),
      'uv_index': data['data'][0]['uv'].toStringAsFixed(1),
      'icon': data['data'][0]['weather']['icon'],
    };

    return weatherData;
  }
}
