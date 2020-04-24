import 'package:flutter/material.dart';
import '../constants.dart';
import 'form_dialog.dart';


class OnboardingPage extends StatefulWidget {
  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: defaultSize.width - 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Text("Welcome to Hungies!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 28)),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Text("Before we begin, we just have to ask a question "
                        "to provide you with the best possible experience.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  ),
                ],
              ),
              SizedBox(height: 60),
              FlatButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => PopupDialog()),
                  child: Container(
                      height: 65,
                      width: 185,
                      decoration:
                      BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius:
                        BorderRadius
                            .circular(
                            60.0),
                      ),
                      child: Center(
                        child: Text("Let's begin!",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.normal,
                        fontSize: 20)),
                      ))),
              SizedBox(height: 60),
              Icon(
                Icons.fastfood,
                color: PRIMARY_COLOR,
                size: 60,
              )
            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
