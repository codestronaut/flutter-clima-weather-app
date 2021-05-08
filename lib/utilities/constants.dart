import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// BASE URL
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

// URLS
String getWeatherByLocationUrl(double lat, double lon) {
  return '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
}

String getWeatherByCityUrl(String cityName) {
  return '$baseUrl?q=$cityName&appid=$apiKey&units=metric';
}

// API KEY
const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';

// COLORS
const kPrimaryDarkColor = Color(0xFF1A192B);
const kPrimaryColor = Color(0xFF25263A);
const kTealColor = Color(0xFF7FBDCA);

// CONSTANT TEXTS
const String kWindLabel = 'Wind';
const String kTempLabel = 'Temp';
const String kHumidityLabel = 'Humidity';
const String kWindUnit = 'km/h';
const String kTempUnit = '°C';
const String kHumidityUnit = '%';
const String kTodayLabel = 'Today';

// TEXT STYLES
var kLocationTextStyle = GoogleFonts.raleway(
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);

var kLightLabelTextStyle = GoogleFonts.raleway(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

var kBoldLabelTextStyle = GoogleFonts.poppins(
  fontSize: 24.0,
  fontWeight: FontWeight.w600,
);

var kBoldValueTextStyle = GoogleFonts.poppins(
  fontSize: 35.0,
  fontWeight: FontWeight.w600,
);

var kUnitTextStyle = GoogleFonts.poppins(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

const kCustomInputDecoration = InputDecoration(
  hintText: 'Search city',
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
