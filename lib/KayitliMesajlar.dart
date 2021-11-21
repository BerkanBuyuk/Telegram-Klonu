import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_klonu/KayitliMesajlar2.dart';

class KayitliMesajlar extends StatefulWidget {
  const KayitliMesajlar({Key? key}) : super(key: key);

  @override
  _KayitliMesajlarState createState() => _KayitliMesajlarState();
}

class _KayitliMesajlarState extends State<KayitliMesajlar> {

  bool arama = false;

  @override
  Widget build(BuildContext context) {

    final urlImage = 'https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_bookmark_border_48px-512.png';

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
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => KayitliMesajlar2()));
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF0088cc),
                    backgroundImage: NetworkImage(urlImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Kayıtlı Mesajlar"),
                  ),
                ],
              ),
            ),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.cleaning_services),
                    title: Text('Geçmişi temizle'),
                  ),
                ),

                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading: Icon(Icons.format_paint_outlined),
                    title: Text('Renkleri değiştir'),
                  ),
                ),

                PopupMenuItem(
                  value: 3,
                  child: ListTile(
                    leading: Icon(Icons.restore_from_trash),
                    title: Text('Sohbeti sil'),
                  ),
                ),

                PopupMenuItem(
                  value: 4,
                  child: ListTile(
                    leading: Icon(Icons.add_box_outlined),
                    title: Text('Ana ekrana ekle'),
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
          ),
        ],
      ),
    );
  }
}
