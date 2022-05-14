import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/loading_screen.dart';

import 'bloc/weather_app_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherAppBloc(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: LoadingScreen(),
      ),
    );
  }
}
