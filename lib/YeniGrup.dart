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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yeni Grup",),
            Text("en fazla 200000 üye", style: TextStyle(color: Colors.white38, fontSize: 17),),
          ],
        ),
        backgroundColor: Color(0xFF71a6d2),
        centerTitle: false,
      ),
    );
  }
}
