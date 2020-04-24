import 'package:flutter/material.dart';
import 'package:hungies/views/home_page.dart';
import '../constants.dart';

class PopupDialog extends StatefulWidget {
  @override
  PopupDialogState createState() => PopupDialogState();
}

class PopupDialogState extends State<PopupDialog> {
  bool american = false;
  bool chinese = false;
  bool indian = false;
  bool greek = false;
  bool lebanese = false;
  bool mexican = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: CARD_GREY,
        title: Text('Cuisine',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20),
            textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Select your cuisine preferences below.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16)),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: american,
                        onChanged: (bool value) {
                          setState(() {
                            american = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "American",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: chinese,
                        onChanged: (bool value) {
                          setState(() {
                            chinese = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Chinese",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: indian,
                        onChanged: (bool value) {
                          setState(() {
                            indian = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Indian",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: greek,
                        onChanged: (bool value) {
                          setState(() {
                            greek = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Greek",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: lebanese,
                        onChanged: (bool value) {
                          setState(() {
                            lebanese = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Lebanese",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: PRIMARY_COLOR,
                        checkColor: Colors.black,
                        value: mexican,
                        onChanged: (bool value) {
                          setState(() {
                            mexican = value;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Mexican",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: Container(
                      height: 45,
                      width: 125,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Center(
                        child: Text("I'm ready!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20)),
                      ))),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
