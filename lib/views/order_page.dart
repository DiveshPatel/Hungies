import 'package:flutter/material.dart';
import '../constants.dart';
import 'form_dialog.dart';


class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  double _appBarHeight = 256.0;


  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            leading:  IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon:  Icon(
                Icons.arrow_back,
                color: PRIMARY_COLOR,
                size: 30,
              ),
            ),
            expandedHeight: _appBarHeight,
            flexibleSpace:  FlexibleSpaceBar(
              background:  Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    height: _appBarHeight,
                    decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:150),
                        Text("Test")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate:  SliverChildListDelegate(<Widget>[
              SizedBox(height: 10),
              Container(
                color: Colors.black,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration:  BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            color: CARD_GREY),
                        padding:  const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child:  Column(
                          children: <Widget>[
                            Text(
                              "INFO",
                              style:  TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: PRIMARY_COLOR,
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Text("1657 Saint-Catherine St W, Montreal, Quebec H3H 1L7",
                                    style:  TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: PRIMARY_COLOR,
                                ),
                                SizedBox(width: 10),
                                Text("(514) 939-3329",
                                  style:  TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  color: PRIMARY_COLOR,
                                ),
                                SizedBox(width: 10),
                                Text("9:00  AM - 8:00 PM",
                                    style:  TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.normal))
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.directions_walk,
                                  color: PRIMARY_COLOR,
                                ),
                                SizedBox(width: 10),
                                Text("7 min (600 m)",
                                  style:  TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.public,
                                  color: PRIMARY_COLOR,
                                ),
                                SizedBox(width: 10),
                                Text("3amigosrestaurants.com",
                                  style:  TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding:  const EdgeInsets.all(15),
                      decoration:  BoxDecoration(
                          borderRadius:  BorderRadius.circular(20.0),
                          color: CARD_GREY),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "ABOUT",
                            style:  TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                              "3 amigos is a place where you may find mexican style cuisine. "
                                  "It offers fine sit-down dining as well as take-out with a variety of dessert and drinks.",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius:  BorderRadius.circular(20.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Image.asset("assets/3amigosfront.jpeg"),
                            Image.asset("assets/3amigosinside.jpeg"),
                            Image.asset("assets/3amigos2.jpg"),
                            Image.asset("assets/3amigos3.jpg")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10),
          child: FlatButton(
              child: Container(
                  height: 65,
                  width: 150,
                  decoration:
                  BoxDecoration(
                    color: CARD_GREY,
                    borderRadius:
                    BorderRadius
                        .circular(
                        60.0),
                  ),
                  child: Center(
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 20,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  )))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
