import 'package:clima/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'forecast.dart';

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
  }

  void updateUI([dynamic weather]) async {
    // if (weather == null) {
    //   weather = await forecast.getData();
    // }
    setState(() {
      if (weather != null) {
        weatherData = weather;
      } else {
        weatherData = {
          'location': 'Region',
          'local_time': DateTime.now().toString(),
          'description': 'Cloudy',
          'temperature': '25',
          'feels_like': '25',
          'wind_speed': '0',
          'humidity': '90',
          'uv_index': '1.5',
          'icon': 't01d',
          // 'https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png',
        };
      }
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
          onSubmitted: (String place) async {
            context.loaderOverlay.show();
            Forecast forecast = Forecast(location: place);
            dynamic locationWeather = await forecast.getData();
            updateUI(locationWeather);
            context.loaderOverlay.hide();
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            // filled: true,
            hintText: ' Search for places...',
            hintStyle: TextStyle(
              fontSize: 20.0,
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
              dynamic weather = await forecast.getData();
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
