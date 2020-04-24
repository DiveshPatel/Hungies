import 'package:flutter/material.dart';
import 'package:hungies/widgets/map.dart';
import '../constants.dart';
import 'form_dialog.dart';


class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  double _appBarHeight = 150;


  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
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
                        Text("Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                        ),)
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
                              "Tacos",
                              style:  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Taco Platter", style: TextStyle(
                                  color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Taco Grille", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        decoration:  BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            color: CARD_GREY),
                        padding:  const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child:  Column(
                          children: <Widget>[
                            Text(
                              "Burritos",
                              style:  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Burrito", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Burrito Con Frutos Del Mar", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        decoration:  BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            color: CARD_GREY),
                        padding:  const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child:  Column(
                          children: <Widget>[
                            Text(
                              "Enchiladas",
                              style:  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Enchiladas Classique", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Enchiladas con Mole", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Enchiladas de Pollo", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Poblano Chili Enchiladas", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Enchilada bandera Mexicana", style: TextStyle(
                                    color: Colors.white
                                )),
                                OrderItem()
                              ],
                            )
                          ],
                        )
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
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Map())),
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

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() =>  _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          _itemCount!=0?   IconButton(icon:  Icon(Icons.remove, color: Colors.white),onPressed: ()=>setState(()=>_itemCount--)): Container(),
           Text(_itemCount.toString(), style: TextStyle(
              color: Colors.white
          )),
           IconButton(icon:  Icon(Icons.add, color: Colors.white,),onPressed: ()=>setState(()=>_itemCount++))
        ],
      );
  }
}
