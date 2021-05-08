part of 'screens.dart';

class CityScreen extends StatefulWidget {
  CityScreen({Key key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _controller.clear();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Search Weather',
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            focusNode: _focus,
            controller: _controller,
            cursorColor: Colors.white,
            decoration: kCustomInputDecoration.copyWith(
              errorStyle: kLightLabelTextStyle.copyWith(
                color: Colors.amber,
              ),
              errorText: _validate ? 'City name can\'t be empty' : null,
              suffixIcon: FocusScope.of(context).hasFocus
                  ? IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _controller.clear();
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : Icon(Icons.search),
            ),
            onSubmitted: (value) {
              if (_controller.text.isEmpty) {
                _validate = true;
                FocusScope.of(context).unfocus();
              } else {
                _validate = false;
                FocusScope.of(context).unfocus();
                Navigator.pop(context, value);
              }
            },
          ),
        ),
      ),
    );
  }
}
