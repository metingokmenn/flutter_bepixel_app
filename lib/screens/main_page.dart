import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/enter_number_page.dart';
import 'package:flutter_bepixel_app/screens/scan_qr_page.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabTextIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 2,
              child: _tabTextIndexSelected == 0
                  ? const ScanQRScreen()
                  : EnterNumberScreen()),
          Expanded(
            flex: 1,
            child: Center(
              child: FlutterToggleTab(
                width: 90, // width in percent
                borderRadius: 30,
                height: 50,
                selectedIndex: _tabTextIndexSelected,
                selectedBackgroundColors: [
                  const Color.fromARGB(255, 237, 159, 57),
                  Theme.of(context).colorScheme.primary.withOpacity(0.5)
                ],
                selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                labels: const ['Scan QR', 'Enter The Number'],
                selectedLabelIndex: (index) {
                  setState(() {
                    _tabTextIndexSelected = index;
                  });
                },
                isScroll: false,
              ),
            ),
          ),
        ],
      ),
    );

    //TO-DO Indexe göre sayfa !!!!!!!
  }
}
