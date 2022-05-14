import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: kTextFieldInputDecoration),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                  // style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(
                  //     Colors.black.withOpacity(0.0)),
                  //padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                  //   textStyle: MaterialStateProperty.all(
                  //     TextStyle(fontSize: 30),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
