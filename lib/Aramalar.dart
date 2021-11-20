import 'package:flutter/material.dart';
import 'package:telegram_klonu/KisiSecin.dart';

class Aramalar extends StatefulWidget {
  const Aramalar({Key? key}) : super(key: key);

  @override
  _AramalarState createState() => _AramalarState();
}

class _AramalarState extends State<Aramalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aramalar"),
        centerTitle: false,
        backgroundColor: Color(0xFF71a6d2),
        actions: [
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Tüm Aramaları Sil",),
              ),
            ],
            onCanceled: (){

            },
            onSelected: (menuItemValue){
              if(menuItemValue == 1){

              }
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF71a6d2),
        child: const Icon(Icons.call,size: 27,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => KisiSecin()));
        },
      ),

    );
  }
}
