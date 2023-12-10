// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/color_screen.dart';
import 'package:flutter_bepixel_app/service/app_service.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key, required this.seatID});
  String seatID;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  AppService service = AppService();
  late Future<List<dynamic>> serverTimeFuture;

  @override
  void initState() {
    serverTimeFuture = service.getServerTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'SPECIFIC INFORMATION FOR THE LOCATION',
            textAlign: TextAlign.center,
            style: GoogleFonts.orbitron(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          FutureBuilder<List<dynamic>>(
              future: serverTimeFuture,
              builder: (context, snapshot) {
                return TextButton(
                  onPressed: () async {
                    List<dynamic> data = await service.getServerTime();
                    DateTime serverDate = data[0];

                    DateTime now = DateTime.now();
                    //String data = snapshot.data!;

                    //int serverS = int.parse(data.substring(18, 20));

                    /*int serverMS = int.parse(data
                            .substring(21, data.length - 1)
                            .substring(0, 3)) +
                        serverS * 1000;*/

                    double syncLatency = data[1].inMilliseconds / 2;

                    Future.delayed(Duration(milliseconds: syncLatency.ceil()),
                        () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ColorScreen(
                                seatID: widget.seatID,
                              )));
                    });

                    DateTime syncedTime =
                        now.add(Duration(milliseconds: syncLatency.ceil()));

                    debugPrint(
                        "-------------LOCAL TIME----------------- ${DateTime.now()}");
                    debugPrint(
                        "-------------SERVER TIME----------------- $serverDate");

                    debugPrint(
                        "---------LATENCY-------- ${Duration(milliseconds: syncLatency.ceil())}");

                    debugPrint("-----------SYNCED TIME--------- $syncedTime");
                  },
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 10)),
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text(
                    'Ready',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                );
              })
        ],
      ),
    );
  }
}
