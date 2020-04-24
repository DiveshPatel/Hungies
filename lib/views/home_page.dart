import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:hungies/views/order_page.dart';
import 'package:hungies/widgets/map.dart';
import 'package:hungies/constants.dart';
import '../suggestion_images.dart';
import 'info_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotateAnimation;
  Animation<double> dismissAnimation;
  Animation<double> bottom;
  int booleanFlag = 0;

  List currentRestaurant = restaurantImages;
  List selectedRestaurant = [];
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);

    rotateAnimation = Tween<double>(
      begin: -0,
      end: -0, // Adjust the angle of how much the card rotates when it is dismissed
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
    rotateAnimation.addListener(() { // Adjust how the card rotates when dismissed
      setState(() {
        if (rotateAnimation.isCompleted) { // Check when the future rotation is completed
          var i = currentRestaurant.removeLast();
          currentRestaurant.insert(0, i);
          controller.reset();
        }
      });
    });

    dismissAnimation = Tween<double>( // Adjust how fast card is dismissed
      begin: 0,
      end: 600,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 10,
      end: 150,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ),
    );
  }

  Future swipeAnimation() async {
    try {
      await controller.forward();
    } on TickerCanceled {}
  }

  onDimissCurrentSuggestion(DecorationImage img) {
    setState(() {
      currentRestaurant.remove(img);
    });
  }

  onAddCurrentSuggestion(DecorationImage img) {
    setState(() {
      currentRestaurant.remove(img);
      selectedRestaurant.add(img);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery.of(context).size;
    timeDilation = 1; // Adjust how fast the pages show up
    double initialBottom = 15.0;
    double defaultBottomCardPos = 50;
    var suggestions = currentRestaurant.length;
    double backCardPosition = initialBottom + (suggestions - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: Container(
            child: Icon(
              Icons.message,
              color: PRIMARY_COLOR,
              size: 30,
            ),
          ),
          actions: <Widget>[
            Container(
                child: Icon(
                  Icons.account_circle,
                  color: PRIMARY_COLOR,
                  size: 30.0,
                )),
          ],
          title: Icon(
            Icons.fastfood,
            color: PRIMARY_COLOR,
            size: 30.0,
          ),
        ),
        bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: swipeLeft,
                    child: Container(
                        height: 65,
                        width: 65,
                        decoration:
                        BoxDecoration(
                          color: CARD_GREY,
                          borderRadius:
                          BorderRadius
                              .circular(
                              60.0),
                        ),
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ))),
                FlatButton(
                  onPressed: swipeRight,
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration:
                      BoxDecoration(
                        color: CARD_GREY,
                        borderRadius:
                        BorderRadius
                            .circular(
                            60.0),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: PRIMARY_COLOR,
                      ),
                    ))
              ],
            )),
        body: Container(
          color: Colors.black,
          child: suggestions > 0 // If the number of restaurants suggestions left are greater than 0 then show the stack of cards
              ? Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: currentRestaurant.map((restaurant) { // Here we loop through each of the restaurants and place them accordingly
                    if (currentRestaurant.indexOf(restaurant) == suggestions - 1) {
                      return Positioned(
                        bottom: defaultBottomCardPos + bottom.value,
                        right: booleanFlag == 0 // This ensures that the card rotates properly on swiperight()
                            ? dismissAnimation.value != 0.0 ? dismissAnimation.value : null
                            : null,
                        left: booleanFlag == 1 // This ensures that the card rotates properly on swipeLeft()
                            ? dismissAnimation.value != 0.0 ? dismissAnimation.value : null
                            : null,
                        child: Dismissible(
                          crossAxisEndOffset: -0.1, // Controls how high the card will exit the screen when swiping left or right
                          key: Key("Primary Card"),
                          onDismissed: (DismissDirection direction) {
                            if (direction == DismissDirection.endToStart) {
                              onDimissCurrentSuggestion(restaurant);
                            }
                            else {
                              onAddCurrentSuggestion(restaurant);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
                            }
                          },
                          child: Transform(
                            alignment: booleanFlag == 0
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            transform:
                                Matrix4.skewX(rotateAnimation.value < -10 ? 0.1 : 0.0),
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(booleanFlag == 0
                                  ? rotateAnimation.value / 360
                                  : -rotateAnimation.value / 360),
                              child: Hero(
                                tag: "image",
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute( // Show the info page on tap
                                        builder: (context) => RestaurantInfoPage(selectedImage: restaurant)
                                    ));
                                  },
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: defaultSize.width / 1.2 +
                                          backCardWidth +
                                          10,
                                      height: defaultSize.height / 1.6,
                                      decoration: BoxDecoration(
                                        color: CARD_GREY,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: defaultSize.width / 1.2 +
                                                backCardWidth +
                                                10,
                                            height: defaultSize.height / 2.2,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              image: restaurant,
                                            ),
                                          ),
                                          Container(
                                            padding:  const EdgeInsets.all(15),
                                            decoration:  BoxDecoration(
                                                borderRadius:  BorderRadius.circular(20.0),
                                                color: CARD_GREY),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.directions_walk,
                                                      color: PRIMARY_COLOR,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text("4 min (300 m)",
                                                      style:  TextStyle(color: Colors.white,
                                                          fontWeight: FontWeight.normal),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "About",
                                                      style:  TextStyle(color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                        "Lebanese style restaurant. ",
                                                        style: TextStyle(color: Colors.white,
                                                            fontWeight: FontWeight.normal))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      backCardPosition = backCardPosition - 10;
                      backCardWidth = backCardWidth + 10;
                      return  Positioned(
                        bottom: defaultBottomCardPos + backCardPosition,
                        child:  Card(
                          color: Colors.transparent, // IMPORTANT: No white borders!!!
                          child:  Container(
                            alignment: Alignment.center,
                            width: defaultSize.width / 1.2 + backCardWidth,
                            height: defaultSize.height / 1.6,
                            decoration:  BoxDecoration(
                              color: CARD_GREY,
                              borderRadius:  BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: defaultSize.width / 1.2 + backCardWidth,
                                  height: defaultSize.height / 2.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: restaurant,
                                  ),
                                ),
                                Container(
                                  padding:  const EdgeInsets.all(15),
                                  decoration:  BoxDecoration(
                                      borderRadius:  BorderRadius.circular(20.0),
                                      color: CARD_GREY),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "About",
                                            style:  TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                              "Mexican style restaurant. ",
                                              style: TextStyle(color: Colors.white,
                                                  fontWeight: FontWeight.normal))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }).toList())
              : Center( // Show this if there are no restaurants left to display
                child: Container(
                    width: defaultSize.width - 80,
                  child: Text("Sorry you didn't like any of the choices. We'll try better next time :)",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,),
                ),
              ),
        ));
  }

  swipeRight() {
    if (booleanFlag == 0)
      setState(() {
        booleanFlag = 1;
      });
    swipeAnimation();
    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
  }

  swipeLeft() {
    if (booleanFlag == 1)
      setState(() {
        booleanFlag = 0;
      });
    swipeAnimation();
  }
}
