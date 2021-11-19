import 'package:flutter/material.dart';

class Mesajlar extends StatefulWidget {
  const Mesajlar({Key? key}) : super(key: key);

  @override
  _MesajlarState createState() => _MesajlarState();
}

class _MesajlarState extends State<Mesajlar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Mesajlar"),
    );  }
}
