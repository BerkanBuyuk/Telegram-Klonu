import 'package:flutter/material.dart';

class KayitliMesajlar extends StatefulWidget {
  const KayitliMesajlar({Key? key}) : super(key: key);

  @override
  _KayitliMesajlarState createState() => _KayitliMesajlarState();
}

class _KayitliMesajlarState extends State<KayitliMesajlar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Kayıtlı Mesajlar"),
    );
  }
}
