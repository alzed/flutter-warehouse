import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:clima/secrets.dart';

class Weather {
  Future<dynamic> getWeather(double latitude, double longitude) async {
    http.Response response =
        await http.get(Uri.https('api.weatherbit.io', '/v2.0/current', {
      'key': weatherBitApiKey,
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
      'key': weatherBitApiKey,
      'city': location,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
