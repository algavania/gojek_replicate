import 'package:flutter/material.dart';
import 'package:gojek_replicate/views/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
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
