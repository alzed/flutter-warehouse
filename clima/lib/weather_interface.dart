import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/icon_content.dart';
import 'components/temperature_content.dart';

class WeatherInterface extends StatelessWidget {
  WeatherInterface({
    @required this.location,
    @required this.localTime,
    @required this.icon,
    @required this.description,
    @required this.temperature,
    @required this.feelsLike,
    @required this.windSpeed,
    @required this.humidity,
    @required this.uvIndex,
  });
  final String location;
  final String localTime;
  final String icon;
  final String description;
  final String temperature;
  final String feelsLike;
  final String windSpeed;
  final String humidity;
  final String uvIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image(
              errorBuilder: (context, exception, stackTrace) {
                return Icon(
                  Icons.sentiment_dissatisfied_outlined,
                  size: 60.0,
                );
              },
              image: NetworkImage(
                  'https://www.weatherbit.io/static/img/icons/$icon.png'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TemperatureContent(
                  value: temperature,
                  title: 'Actual',
                ),
                TemperatureContent(
                  value: feelsLike,
                  title: 'Feels Like',
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Divider(
              thickness: 0.8,
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconContent(
                  icon: Icons.cloud,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                IconContent(
                  icon: FontAwesomeIcons.wind,
                  child: Row(
                    children: [
                      Text(
                        windSpeed,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '  km/h',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                IconContent(
                  icon: FontAwesomeIcons.water,
                  child: Row(
                    children: [
                      Text(
                        humidity,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '  g/kg',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
                IconContent(
                  icon: Icons.wb_sunny_outlined,
                  child: Text(
                    uvIndex,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(location),
                ),
                margin: EdgeInsets.all(16.0),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(localTime.substring(11, 16)),
                ),
                margin: EdgeInsets.all(16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
