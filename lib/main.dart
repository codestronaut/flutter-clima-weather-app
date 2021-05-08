import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clima/screens/screens.dart';
import 'package:flutter_clima/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );

    return MaterialApp(
      title: 'Flutter Clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryDarkColor,
        accentColor: kTealColor,
        scaffoldBackgroundColor: kPrimaryDarkColor,
      ),
      home: LoadingScreen(),
    );
  }
}
