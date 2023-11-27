import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/color_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

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
          TextButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const ColorScreen()));
            },
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(200, 10)),
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
            child: const Text(
              'Ready',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
