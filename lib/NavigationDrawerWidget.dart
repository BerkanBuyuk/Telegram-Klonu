import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_klonu/Aramalar.dart';
import 'package:telegram_klonu/ArkadaslariniziDavetEdin.dart';
import 'package:telegram_klonu/Ayarlar.dart';
import 'package:telegram_klonu/KayitliMesajlar.dart';
import 'package:telegram_klonu/Kisiler.dart';
import 'package:telegram_klonu/TelegramOzellikleri.dart';
import 'package:telegram_klonu/UserPage.dart';
import 'package:telegram_klonu/YakindakiKisiler.dart';
import 'package:telegram_klonu/YeniGrup.dart';
import 'package:telegram_klonu/theme/ThemeManager.dart';

ThemeManager _themeManager = ThemeManager();


class NavigationDrawerWidget extends StatefulWidget{
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context){

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    final name = 'Berkan Büyük';
    final numara = '+90 (544) 587 66 55';
    final urlImage = 'https://avatars.githubusercontent.com/u/82314218?s=400&u=8131845f048fa2197b37c7a19562eda1db1536c7&v=4';


    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          //padding: padding,
          children: [
            DrawerHeader(
              //padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    buildAvatar(
                      urlImage: urlImage,
                      onClicked: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(
                        name: name,
                        urlImage: urlImage,
                      )
                      )),
                    ),

                    buildHeader(
                      name: name,
                      numara: numara,
                      onClicked: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(
                        name: name,
                        urlImage: urlImage,
                      )
                      )),
                    ),

                  ],
                ),
              decoration: BoxDecoration(
                color: Color(0xFF71a6d2),
              ),
            ),



            Container(
              //padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Yeni Grup',
                    icon: Icons.group,
                    onClicked: () => selectedItem(context, 0),
                  ),

                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Kişiler',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 1),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Aramalar',
                    icon: Icons.call,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Yakındaki Kişiler',
                    icon: Icons.nature_people,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Kayıtlı Mesajlar',
                    icon: Icons.bookmark_border,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 8,),
                  buildMenuItem(
                    text: 'Ayarlar',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 5,),
                  Divider(color: Colors.blueGrey,),
                  const SizedBox(height: 5,),

                  buildMenuItem(
                    text: 'Arkadaşlarınızı Davet Edin',
                    icon: Icons.person_add,
                    onClicked: () => selectedItem(context, 4),
                  ),

                  const SizedBox(height: 10,),
                  buildMenuItem(
                    text: 'Telegram Özellikleri',
                    icon: Icons.contact_support_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String numara,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          //padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 17, color: Colors.white),),
                  const SizedBox(height: 4,),
                  Text(numara, style: TextStyle(fontSize: 14, color: Colors.white38),)
                ],
              ),
              //Spacer(),
              /*CircleAvatar(
                radius: 14,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white,size: 20,),
              )*/
            ],
          ),
        ),
      );


  Widget buildAvatar({
    required String urlImage,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          //padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage),),
              SizedBox(width: 5,),
              //Spacer(),
              /*CircleAvatar(
                radius: 14,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white,size: 20,),
              )*/
            ],
          ),
        ),
      );






  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, size: 30,),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => YeniGrup(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Kisiler(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Aramalar(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => YakindakiKisiler(),
        ));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => KayitliMesajlar(),
        ));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Ayarlar(),
        ));
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArkadaslariniziDavetEdin(),
        ));
        break;

      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelegramOzellikleri(),
        ));
        break;

    }
  }
}


