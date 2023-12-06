import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class AppService {
  final String urlTime = 'http://54.87.0.175:8080/video/sync';

  Future<DateTime> getServerTime() async {
    Dio dio = Dio();
    try {
      String serverTime = '';
      DateTime serverDateTime = DateTime.now();
      //http.Response httpResponse = await http.get(Uri.parse(urlTime));
      Response<String> response = await dio.get(urlTime);

      if (response.statusCode == 200) {
        String serverTimeString = response.data!;
        serverTimeString =
            serverTimeString.replaceFirst('T', ' ').substring(1, 27);

        serverTime = serverTimeString;
        serverDateTime = DateTime.parse(serverTime);
        serverDateTime = serverDateTime.add(const Duration(hours: 3));
        //serverTime = serverTime.replaceFirst('T', ' ');
      } else {
        serverTime = '';
      }

      return serverDateTime;
    } on HttpException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
