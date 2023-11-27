import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/location_info.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNumberScreen extends StatelessWidget {
  const EnterNumberScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Enter the Number of the Seat',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the Number',
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.4)))),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(200, 10)),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 237, 159, 57))),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => const LocationPage()),
            );
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Text(
          'The QR Code will be automaticly detected when you position it between the guide lines',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 164, 162, 162)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
