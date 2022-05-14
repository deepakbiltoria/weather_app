part of 'weather_app_bloc.dart';

@immutable
abstract class WeatherAppEvent {}

class WeatherAppGetLocationDataEvent extends WeatherAppEvent {}

class WeatherAppReceivedLocationDataEvent extends WeatherAppEvent {}

class WeatherAppUpdateUiDataEvent extends WeatherAppEvent {}
