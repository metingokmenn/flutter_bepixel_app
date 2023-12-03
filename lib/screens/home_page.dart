import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/main_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              'assets/images/galatasaray.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Text(
              'GALATASARAY',
              style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => MainPage()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: Text(
                  'BE PIXEL',
                  style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
