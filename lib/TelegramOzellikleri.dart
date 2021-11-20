import 'package:flutter/material.dart';

class TelegramOzellikleri extends StatefulWidget {
  const TelegramOzellikleri({Key? key}) : super(key: key);

  @override
  _TelegramOzellikleriState createState() => _TelegramOzellikleriState();
}

class _TelegramOzellikleriState extends State<TelegramOzellikleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram Özellikleri"),
        centerTitle: true,
      ),
    );
  }
}
