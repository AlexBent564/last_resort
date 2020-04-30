import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              child: Text(
            "Last Resort",
            style: TextStyle(color: Colors.white, fontSize: 35),
          )),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                  ),
                  Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 80.0,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Text(
                      "Last Resort",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  RoundedButton(
                    title: 'Log In',
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  RoundedButton(
                    title: 'Register',
                    color: Colors.redAccent[400],
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
