part of 'screens.dart';

class LoadingScreen extends StatefulWidget {
  final String fromPage;
  final String cityName;
  LoadingScreen({
    @required this.fromPage,
    this.cityName,
  });

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherController weatherController = WeatherController();
  Weather weather;

  @override
  void initState() {
    // TODO: Check connection
    // If connection is available then load weather
    // Otherwise loading 404 page
    getWeatherData();
    super.initState();
  }

  void getWeatherData() async {
    if (widget.fromPage == 'location') {
      weather = await weatherController.getWeatherByLocation();
    } else if (widget.fromPage == 'city') {
      if (widget.cityName != null) {
        weather = await weatherController.getWeatherByCity(widget.cityName);
      } else {
        weather = await weatherController.getWeatherByLocation();
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weather,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/loading.json'),
        ],
      ),
    );
  }
}
