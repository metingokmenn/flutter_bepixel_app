import 'dart:io';

import 'package:http/http.dart' as http;

class AppService {
  final String urlTime = 'http://54.87.0.175:8080/video/sync';

  Future<String> getServerTime() async {
    try {
      String serverTime = '';
      http.Response httpResponse = await http.get(Uri.parse(urlTime));
      String format = "yyyy-MM-dd HH:mm:ss.SSSSSSSSS";

      if (httpResponse.statusCode == 200) {
        var serverTimeString = httpResponse.body;
        serverTimeString = serverTimeString.replaceFirst('T', ' ');

        serverTime = serverTimeString;
        //serverTime = serverTime.replaceFirst('T', ' ');
      } else {
        serverTime = '';
      }

      return serverTime;
    } on HttpException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
