import 'package:flutter/material.dart';
import '../constants.dart';
import 'form_dialog.dart';


class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
