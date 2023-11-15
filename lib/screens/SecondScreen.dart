import 'package:analytics_test/screens/ThirdScreen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    await analytics.logScreenView(screenName: 'second_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Change to Third screen',
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await analytics.logEvent(
                    name: 'screen',
                    parameters: {'screen_name': "third_screen"});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
                );
              },
              child: Text(
                'Change to third screen',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
