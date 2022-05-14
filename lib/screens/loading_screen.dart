import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/bloc/weather_app_bloc.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final spinKitSpinningLines = SpinKitSpinningLines(
    color: Colors.white60,
    size: 100.0,
    itemCount: 10,
  );

  void initState() {
    super.initState();
    BlocProvider.of<WeatherAppBloc>(context).getInitialLocationData();
  }

  MaterialColor color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherAppBloc, WeatherAppState>(
        listener: (context, state) {
          if (state is WeatherAppReceivedLocationDataState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: spinKitSpinningLines,
          );
        },
      ),
    );
  }
}
