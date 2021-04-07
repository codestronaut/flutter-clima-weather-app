part of 'components.dart';

class WeatherImage extends StatelessWidget {
  final String imageAsset;
  const WeatherImage({
    @required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Center(
        child: Image.asset(
          imageAsset,
          width: 300.0,
        ),
      ),
    );
  }
}
