import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/services/weather.dart';

part 'weather_app_event.dart';
part 'weather_app_state.dart';

class WeatherAppBloc extends Bloc<WeatherAppEvent, WeatherAppState> {
  var weatherJsonData;

  int? temprature;

  int? condition;

  late String cityname;
  var weatherMessage;
  late String weatherIcon;

  WeatherAppBloc() : super(WeatherAppInitial()) {
    on<WeatherAppGetLocationDataEvent>((event, emit) {
      emit(WeatherAppLoadingState());
    });

    on<WeatherAppReceivedLocationDataEvent>(
        (event, emit) => emit(WeatherAppReceivedLocationDataState()));
  }

  void getInitialLocationData() async {
    add(WeatherAppGetLocationDataEvent());
    weatherJsonData = await WeatherModel().getLocationWeather();
    add(WeatherAppReceivedLocationDataEvent());
    updateUI(weatherJsonData);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temprature = 0;

      condition = 0;

      cityname = ' ';
      weatherMessage = 'weatherData returned null';
      weatherIcon = '🤷';
      return;
    }

    temprature = (weatherData['main']['temp']).toInt();

    condition = weatherData['weather'][0]['id'];
    cityname = weatherData['name'];

    weatherMessage = WeatherModel.getMessage(temprature!);

    weatherIcon = WeatherModel.getWeatherIcon(condition!);
  }
}
