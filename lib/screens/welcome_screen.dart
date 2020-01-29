import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import '../components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds:3),
            vsync: this
    );

    controller.forward();

    controller.addListener((){
      setState(() {
      });
    });

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
  }

  @override void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RoundedButton loginButton = RoundedButton(buttonColor: Colors.lightBlueAccent,
        buttonText: "Log in",
        onPressed: () {Navigator.pushNamed(context, LoginScreen.id);});

    RoundedButton registerButton = RoundedButton(buttonColor: Colors.blueAccent,
      buttonText: "Register",
      onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);},);

    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Row(
        children: <Widget>[
          Hero(tag: 'logo',
          child: Container(
            child: Image.asset('images/logo.png'),
            height: 60,
          ),
        ),
        TypewriterAnimatedTextKit(
          text: ['Flash Chat'],
          textStyle: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        ],
      ),
            SizedBox(
              height: 48.0,
            ),
            loginButton,
            registerButton,
          ],
        ),
      ),
    );
  }
}
