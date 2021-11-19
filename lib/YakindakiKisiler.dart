import 'package:flutter/material.dart';

class YakindakiKisiler extends StatefulWidget {
  const YakindakiKisiler({Key? key}) : super(key: key);

  @override
  _YakindakiKisilerState createState() => _YakindakiKisilerState();
}

class _YakindakiKisilerState extends State<YakindakiKisiler> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Yakındaki Kişiler"),
    );
  }
}
