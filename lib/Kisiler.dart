import 'package:flutter/material.dart';

class Kisiler extends StatefulWidget {
  const Kisiler({Key? key}) : super(key: key);

  @override
  _KisilerState createState() => _KisilerState();
}

class _KisilerState extends State<Kisiler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişiler"),
        centerTitle: true,
      ),
    );
  }
}
