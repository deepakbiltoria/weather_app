part of 'weather_app_bloc.dart';

@immutable
abstract class WeatherAppState {}

class WeatherAppInitial extends WeatherAppState {}

class WeatherAppLoadingState extends WeatherAppState {}

class WeatherAppReceivedLocationDataState extends WeatherAppState {}

//class WeatherAppReceivedCurrentLocationDataState extends WeatherAppState {}

class WeatherAppUpdateUiDataState extends WeatherAppState {}
