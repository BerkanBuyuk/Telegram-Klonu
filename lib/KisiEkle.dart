import 'package:flutter/material.dart';

class KisiEkle extends StatefulWidget {
  const KisiEkle({Key? key}) : super(key: key);

  @override
  _KisiEkleState createState() => _KisiEkleState();
}

class _KisiEkleState extends State<KisiEkle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71a6d2),
        centerTitle: false,
        title: Text("Kişi Ekle"),
        actions: [
          IconButton(icon: Icon(Icons.done), onPressed: (){

          },)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("data"),
          ),
        ],
      ),
    );
  }
}
