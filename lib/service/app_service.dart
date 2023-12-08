import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/model/seat_color.dart';

class AppService {
  final String urlTime = 'http://54.87.0.175:8080/video/sync';
  final String urlVideo = 'http://54.87.0.175:8080/video';
  Dio dio = Dio();
  Future<DateTime> getServerTime() async {
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
        //serverDateTime = serverDateTime.add(const Duration(hours: 3));
        //serverTime = serverTime.replaceFirst('T', ' ');
      } else {
        serverTime = '';
      }

      return serverDateTime;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  Future<SeatColor> getColorSequence(String seatID) async {
    late SeatColor data;
    try {
      Response<String> response = await dio.get('$urlVideo/$seatID');
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        data = SeatColor.fromJson(response.data!);
      } else {
        data = SeatColor(seatId: 'x9', colorSequence: [0, 0, 0, 0, 0]);
      }

      return data;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
