part of 'screens.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // This is dummy data - will be remove later
  List time = [
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_searching),
          onPressed: () {
            // Go to user location
          },
        ),
        title: Text(
          'Bandung', // Hardcoded - will be change later
          style: kLocationTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search for a location
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: WeatherImage(
              imageAsset: 'assets/storm.png',
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardMargin: const EdgeInsets.all(16.0),
              cardGradient: kPrimaryGradient,
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
                            '8', // Hardcoded - will be change later
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
                            '18', // Hardcoded - will be change later
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
                            '79', // Hardcoded - will be change later
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
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kTodayLabel,
                          style: kBoldLabelTextStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_rounded),
                          onPressed: () {
                            // Go to forecast page
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: time.length,
                    itemBuilder: (context, index) {
                      return ReusableCard(
                        cardColor: kPrimaryColor,
                        cardPadding: EdgeInsets.all(24.0),
                        cardMargin: EdgeInsets.fromLTRB(
                          16.0,
                          14.0,
                          0.0,
                          24.0,
                        ),
                        cardGradient: index == 1 ? kPrimaryGradient : null,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${time[index]}',
                              style: kLightLabelTextStyle,
                            ),
                            SizedBox(height: 12.0),
                            Image.asset(
                              'assets/clear.png',
                              height: 48.0,
                              width: 48.0,
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Text(
                                  '18',
                                  style: kUnitTextStyle,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
