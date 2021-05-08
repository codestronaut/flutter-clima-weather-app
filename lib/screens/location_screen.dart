part of 'screens.dart';

class LocationScreen extends StatefulWidget {
  final Weather weatherData;
  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherController weatherController = WeatherController();
  Weather weather;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(Weather weatherData) {
    setState(() {
      weather = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_searching),
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoadingScreen(fromPage: 'location'),
              ),
            );
          },
        ),
        title: Text(
          weather.city,
          style: kLocationTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: WeatherImage(
                        imageAsset: weatherController.getWeatherImage(
                          weather.condition,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ReusableCard(
                        cardMargin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 24.0,
                        ),
                        cardColor: kTealColor,
                        cardChild: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  kWindLabel,
                                  style: kLightLabelTextStyle,
                                ),
                                SizedBox(height: 2.0),
                                Row(
                                  children: [
                                    Text(
                                      '${weather.wind.toInt()}',
                                      style: kBoldValueTextStyle,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      kWindUnit,
                                      style: kUnitTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  kTempLabel,
                                  style: kLightLabelTextStyle,
                                ),
                                SizedBox(height: 2.0),
                                Row(
                                  children: [
                                    Text(
                                      '${weather.temperature.toInt()}', // Hardcoded - will be change later
                                      style: kBoldValueTextStyle,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      kTempUnit,
                                      style: kUnitTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  kHumidityLabel,
                                  style: kLightLabelTextStyle,
                                ),
                                SizedBox(height: 2.0),
                                Row(
                                  children: [
                                    Text(
                                      '${weather.humidity}',
                                      style: kBoldValueTextStyle,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      kHumidityUnit,
                                      style: kUnitTextStyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
