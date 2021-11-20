import 'package:flutter/material.dart';

class YakindakiKisiler extends StatefulWidget {
  const YakindakiKisiler({Key? key}) : super(key: key);

  @override
  _YakindakiKisilerState createState() => _YakindakiKisilerState();
}

class _YakindakiKisilerState extends State<YakindakiKisiler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yakındaki Kişiler"),
        centerTitle: true,
      ),
    );
  }
}
