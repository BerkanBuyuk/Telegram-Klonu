import 'package:flutter/material.dart';

class KayitliMesajlar2 extends StatefulWidget {
  const KayitliMesajlar2({Key? key}) : super(key: key);

  @override
  State<KayitliMesajlar2> createState() => _KayitliMesajlar2State();
}

class _KayitliMesajlar2State extends State<KayitliMesajlar2> {
  @override
  Widget build(BuildContext context) {

    final urlImage = 'https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_bookmark_border_48px-512.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blueGrey,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(urlImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kayıtlı Mesajlar", style: TextStyle(color: Colors.black),),
                  Text("0 medya", style: TextStyle(color: Colors.blueGrey, fontSize: 15),),
                ],
              ),
            ),
            Spacer(),
            PopupMenuButton(
              child: Icon(Icons.more_vert,color: Colors.black,),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.zoom_in),
                    title: Text('Yakınlaştır'),
                  ),
                ),

                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading: Icon(Icons.zoom_out),
                    title: Text('Uzaklaştır'),
                  ),
                ),

                PopupMenuItem(
                  value: 3,
                  child: ListTile(
                    leading: Icon(Icons.calendar_today_outlined),
                    title: Text('Takvim'),
                  ),
                ),
              ],
              onCanceled: (){

              },

              onSelected: (menuItemValue){
                if(menuItemValue == 1){

                }

                if(menuItemValue == 2){

                }

                if(menuItemValue == 3){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
