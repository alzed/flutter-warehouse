import 'package:clima/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services/forecast.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Forecast forecast = Forecast();
  Map<String, String> weatherData;

  final searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateUI();
    getData();
  }

  void getData() async {
    Map<String, String> initWeather = await forecast.getData();
    updateUI(initWeather);
  }

  void updateUI([dynamic weather]) {
    setState(() {
      if (weather == null) {
        weatherData = {
          'location': '...',
          'local_time': DateTime.now().toString(),
          'description': '...',
          'temperature': '...',
          'feels_like': '...',
          'wind_speed': '...',
          'humidity': '...',
          'uv_index': '...',
          'icon': 'c02d',
        };
        return;
      }
      weatherData = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          controller: searchText,
          cursorColor: Colors.white,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(
            fontSize: 23.0,
          ),
          onSubmitted: (String place) async {
            if (place != '') {
              context.loaderOverlay.show();
              Forecast forecast = Forecast(location: place);
              Map<String, String> locationWeather = await forecast.getData();
              updateUI(locationWeather);
              context.loaderOverlay.hide();
            }
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: ' Search for places...',
            hintStyle: TextStyle(
              fontSize: 23.0,
              color: Colors.grey,
            ),
            suffix: IconButton(
              icon: Icon(
                Icons.close,
              ),
              onPressed: () {
                searchText.clear();
              },
            ),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_outlined),
            splashRadius: 25.0,
            onPressed: () async {
              searchText.clear();
              context.loaderOverlay.show();
              Map<String, String> weather = await forecast.getData();
              updateUI(weather);
              context.loaderOverlay.hide();
            },
          ),
        ],
      ),
      body: LoaderOverlay(
        useDefaultLoading: false,
        overlayColor: Colors.black12,
        overlayWidget: Center(
          child: SpinKitPulse(
            color: Colors.grey,
            size: 100.0,
          ),
        ),
        child: WeatherInterface(
          location: weatherData['location'],
          localTime: weatherData['local_time'],
          icon: weatherData['icon'],
          description: weatherData['description'],
          temperature: weatherData['temperature'],
          feelsLike: weatherData['feels_like'],
          windSpeed: weatherData['wind_speed'],
          humidity: weatherData['humidity'],
          uvIndex: weatherData['uv_index'],
        ),
      ),
    );
  }
}
