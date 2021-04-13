import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// BASE URL
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

// API KEY
const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';

// COLORS
const kPrimaryDarkColor = Color(0xFF1A192B);
const kPrimaryColor = Color(0xFF25263A);
const kPrimaryGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFFFA62E4),
    Color(0xFF3463F2),
  ],
);

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
