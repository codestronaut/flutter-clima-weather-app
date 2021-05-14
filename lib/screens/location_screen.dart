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
                child: WeatherContent(
                  weatherImage: weatherController.getWeatherImage(
                    weather.condition,
                  ),
                  temperature: weather.temperature,
                  wind: weather.wind,
                  humidity: weather.humidity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
