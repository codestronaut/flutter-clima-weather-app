import 'package:flutter/material.dart';
import 'package:flutter_clima/utilities/constants.dart';
import 'package:flutter_clima/widgets/widgets.dart';

class WeatherContent extends StatelessWidget {
  final String weatherImage;
  final num temperature;
  final num wind;
  final num humidity;
  const WeatherContent({
    @required this.weatherImage,
    @required this.temperature,
    @required this.wind,
    @required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          '${wind.toInt()}',
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
                          '${temperature.toInt()}', // Hardcoded - will be change later
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
    );
  }
}
