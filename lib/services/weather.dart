import 'package:flutter_clima/models/location.dart';
import 'package:flutter_clima/services/networking.dart';
import 'package:flutter_clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$baseUrl?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      // thunderstorm
      return 'assets/thunderstorm.png';
    } else if (condition < 400) {
      // drizzle
      return 'assets/drizzle.png';
    } else if (condition < 600) {
      // rain
      return 'assets/rain.png';
    } else if (condition < 700) {
      // snow
      return 'assets/snow.png';
    } else if (condition < 800) {
      // clear
      return 'assets/clear.png';
    } else if (condition < 804) {
      // cloudy
      return 'assets/cloudy.png';
    } else {
      return 'assets/stars.png';
    }
  }
}
