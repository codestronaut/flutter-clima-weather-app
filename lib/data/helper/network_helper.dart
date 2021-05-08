import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            Duration(seconds: 5),
          );

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);

        return decodedData;
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }
}
