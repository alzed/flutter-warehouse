import 'package:http/http.dart' as http;
import 'dart:convert';

const weatherApi = 'REPLACE_WEATHERBIT_API_KEY';

class Weather {
  Future<dynamic> getWeather(double latitude, double longitude) async {
    http.Response response =
        await http.get(Uri.https('api.weatherbit.io', '/v2.0/current', {
      'key': weatherApi,
      'lat': latitude.toString(),
      'lon': longitude.toString(),
    }));

    var data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getWeatherLocation(String location) async {
    http.Response response =
        await http.get(Uri.https('api.weatherbit.io', '/v2.0/current', {
      'key': weatherApi,
      'city': location,
    }));

    var data = jsonDecode(response.body);
    return data;
  }
}
