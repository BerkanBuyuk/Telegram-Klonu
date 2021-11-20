import 'package:flutter/material.dart';

class KisiSecin extends StatefulWidget {
  const KisiSecin({Key? key}) : super(key: key);

  @override
  _KisiSecinState createState() => _KisiSecinState();
}

class _KisiSecinState extends State<KisiSecin> {

  bool arama = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71a6d2),
        centerTitle: false,
        title: arama ?
        TextField(
          decoration: InputDecoration(hintText: "Bul"),
          onChanged: (arama){
            print("Arama sonucu = $arama");
          },
        )
            :
        Text("Kişi Seçin"),
        actions: [
          arama ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                arama = false;
              });
            },
          )
              :
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Arama iconu",
            onPressed: (){
              setState(() {
                arama = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
