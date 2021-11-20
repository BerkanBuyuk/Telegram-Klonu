import 'package:flutter/material.dart';
import 'package:telegram_klonu/KisiEkle.dart';

class Kisiler extends StatefulWidget {
  const Kisiler({Key? key}) : super(key: key);

  @override
  _KisilerState createState() => _KisilerState();
}

class _KisilerState extends State<Kisiler> {

  bool arama = false;
  bool notesGorunurluk = true;

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
        Text("Kişiler"),
        actions: [
          arama ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                arama = false;
                notesGorunurluk = true;
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
                notesGorunurluk = false;
              });
            },
          ),
          Visibility(
            visible: notesGorunurluk,
            child: IconButton(
              icon: Icon(Icons.notes,),
              tooltip: "Arama iconu",
              onPressed: (){
                setState(() {});
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF71a6d2),
        child: const Icon(Icons.person_add_alt_1,size: 27,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => KisiEkle()));
        },
      ),
    );
  }
}







