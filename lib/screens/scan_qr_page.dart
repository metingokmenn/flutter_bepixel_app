import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/location_info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({
    super.key,
  });

  @override
  State<ScanQRScreen> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  void _foundBarcode(BarcodeCapture capture) {
    if (!_screenOpened) {
      final List<Barcode> barcodes = capture.barcodes;

      for (final barcode in barcodes) {
        if (barcode.rawValue!.startsWith("GS_KALAMIS-")) {
          debugPrint(barcode.rawValue);
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => const LocationPage()),
          );
          _screenOpened = true;
        }
      }
    }
  }

  Column body() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Scan QR Code of the Seat',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: MobileScanner(
            onDetect: _foundBarcode,
            controller: cameraController,
          ),
        ),

        //Image.asset('assets/images/qr.png')),
        const SizedBox(
          height: 20,
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
