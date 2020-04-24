import 'package:flutter/material.dart';
import 'package:hungies/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Panel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PanelState();
  }
}

class PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    List<String> movements = List();
    movements.add("Head north straight towards Boulevard de Maisonneuve");
    movements.add("Turn left on Guy St");
    movements.add(
        "Turn right on Saint-Catherine St W. Destination will be on the right.");
    return Visibility(
        visible: true,
        child: SlidingUpPanel(
          minHeight: 80,
          panelBuilder: (ScrollController sc) => _scrollingList(sc, movements),
          collapsed: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.maximize, color: Colors.white),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.directions_walk,
                        color: Colors.white,
                      ),
                      Flexible(
                        child: Text(
                          "Estimated time: 7 min (0.6 km)",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () => {})
                    ],
                  ),
                ],
              ),
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ));
  }

  Widget _scrollingList(ScrollController sc, List<String> movements) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: ListView.builder(
        controller: sc,
        itemCount: movements.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${i + 1}.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text("${movements[i]}",
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
