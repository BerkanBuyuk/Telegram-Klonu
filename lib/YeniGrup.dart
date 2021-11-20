import 'package:flutter/material.dart';

class YeniGrup extends StatefulWidget {
  const YeniGrup({Key? key}) : super(key: key);

  @override
  _YeniGrupState createState() => _YeniGrupState();
}

class _YeniGrupState extends State<YeniGrup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Grup"),
        centerTitle: true,
      ),
    );
  }
}
