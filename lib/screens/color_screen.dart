// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/model/seat_color.dart';
import 'package:flutter_bepixel_app/service/app_service.dart';

class ColorScreen extends StatefulWidget {
  ColorScreen({super.key, required this.seatID});
  String seatID;

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  AppService service = AppService();
  late Future<SeatColor> colorSequenceFuture;
  int currentIndex = 0;

  late Timer timer;
  late SeatColor seatColor;

  @override
  void initState() {
    debugPrint(widget.seatID);
    colorSequenceFuture = service.getColorSequence(widget.seatID);

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex < seatColor.colorSequence.length - 1) {
        setState(() {
          currentIndex++;
          debugPrint("Current index $currentIndex");
          debugPrint(seatColor.colorSequence[currentIndex].toString());
        });
      } else {
        setState(() {
          currentIndex = 0;
          debugPrint("Current index $currentIndex");
          debugPrint(seatColor.colorSequence[currentIndex].toString());
        });
      }
    });
    super.initState();
  }

  Color getColor() {
    switch (seatColor.colorSequence[currentIndex]) {
      case 1:
        return Colors.red;

      case 2:
        return Colors.blue;

      case 3:
        return Colors.green;

      case 4:
        return Colors.yellow;
      case 5:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<SeatColor>(
            future: colorSequenceFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                seatColor = snapshot.data!;

                return Container(
                  color: getColor(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('An error occured'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
