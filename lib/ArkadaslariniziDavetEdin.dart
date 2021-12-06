import 'package:flutter/material.dart';

class ArkadaslariniziDavetEdin extends StatefulWidget {
  const ArkadaslariniziDavetEdin({Key? key}) : super(key: key);

  @override
  _ArkadaslariniziDavetEdinState createState() => _ArkadaslariniziDavetEdinState();
}

class _ArkadaslariniziDavetEdinState extends State<ArkadaslariniziDavetEdin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arkadaşlarınızı Davet Edin", style: TextStyle(),),
        centerTitle: true,
      ),
    );
  }
}
