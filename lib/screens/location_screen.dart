part of 'screens.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherController weather = WeatherController();

  int temperature;
  int windSpeed;
  int humidity;
  String weatherImage;
  String cityName;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var wind = weatherData['wind']['speed'];
      windSpeed = wind.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherImage = weather.getWeatherImage(condition);
      humidity = weatherData['main']['humidity'];
      cityName = weatherData['name'];
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
            var weatherData = await weather.getLocationWeather();
            updateUI(weatherData);
          },
        ),
        title: Text(
          cityName,
          style: kLocationTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );

              print(result);

              if (result != null) {
                var weatherData = await weather.getCityWeather(result);
                updateUI(weatherData);
              } else {
                var weatherData = await weather.getLocationWeather();
                updateUI(weatherData);
              }
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
                        imageAsset: weatherImage,
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
                                      '$windSpeed',
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
                                      '$temperature', // Hardcoded - will be change later
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
                                      '$humidity',
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
