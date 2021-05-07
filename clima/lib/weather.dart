import 'package:http/http.dart' as http;
import 'dart:convert';

const weatherApi = '00d831f0313b4f3283917dda5d0ac6a0';

class Weather {
  Future<dynamic> getWeather(double latitude, double longitude) async {
    http.Response response =
        await http.get(Uri.https('api.weatherbit.io', '/v2.0/current', {
      'key': weatherApi,
      'lat': latitude.toString(),
      'lon': longitude.toString(),
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<dynamic> getWeatherLocation(String location) async {
    http.Response response =
        await http.get(Uri.https('api.weatherbit.io', '/v2.0/current', {
      'key': weatherApi,
      'city': location,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
