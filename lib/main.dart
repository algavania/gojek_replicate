import 'package:flutter/material.dart';
import 'package:gojek_replicate/home.dart';

void main() {
  const MaterialColor primarySwatch = const MaterialColor(
    0xFF2E7D32,
    const <int, Color>{
      50: const Color(0xFF2E7D32),
      100: const Color(0xFF2E7D32),
      200: const Color(0xFF2E7D32),
      300: const Color(0xFF2E7D32),
      400: const Color(0xFF2E7D32),
      500: const Color(0xFF2E7D32),
      600: const Color(0xFF2E7D32),
      700: const Color(0xFF2E7D32),
      800: const Color(0xFF2E7D32),
      900: const Color(0xFF2E7D32),
    },
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color(0xFF2E7D32),
        primarySwatch: primarySwatch,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green[800],
          ),
        )),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 5,
                  child: Center(child: Image.asset('assets/gojek.png'))),
              SizedBox(height: 20),
              Expanded(
                  flex: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: Image.asset('assets/logo.png')),
                      Expanded(flex: 3, child: Container()),
                    ],
                  )),
              SizedBox(height: 10),
              Expanded(
                  flex: 0,
                  child: Text('Welcome, Keith!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              SizedBox(height: 10),
              Expanded(
                  child: Text(
                      'Discover a hassle-free life with the super app for all your needs.',
                      style: TextStyle(color: Colors.grey, fontSize: 16))),
              SizedBox(height: 10),
              Expanded(
                  child: ElevatedButton(
                child: Text('Login as Keith', style: TextStyle(fontSize: 16)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    )),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              )),
              SizedBox(height: 10),
              Expanded(
                  child: OutlinedButton(
                child: Text(
                  'Login with phone number',
                  style: TextStyle(color: Colors.green[800], fontSize: 16),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                )),
                onPressed: () {},
              )),
              SizedBox(height: 20),
              Expanded(
                  flex: 1,
                  child: Text(
                    'By logging in or registering, you agree to our Terms of Service and Privacy Policy.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
