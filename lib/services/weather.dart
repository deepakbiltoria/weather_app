import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const String apiKey = 'bf74ed560876aca5822d57f4313d6875';
const String openWeatherMapUrl =
    'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '${openWeatherMapUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherJsonData = await networkHelper.getData();

    return weatherJsonData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
