import 'dart:math';

import 'package:flutter/material.dart';
import 'package:telegram_klonu/Aramalar.dart';
import 'package:telegram_klonu/ArkadaslariniziDavetEdin.dart';
import 'package:telegram_klonu/Ayarlar.dart';
import 'package:telegram_klonu/KayitliMesajlar.dart';
import 'package:telegram_klonu/Kisiler.dart';
import 'package:telegram_klonu/Mesajlar.dart';
import 'package:telegram_klonu/TelegramOzellikleri.dart';
import 'package:telegram_klonu/YakindakiKisiler.dart';
import 'package:telegram_klonu/YeniGrup.dart';
import 'package:telegram_klonu/theme/ThemeConstans.dart';
import 'package:telegram_klonu/theme/ThemeManager.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {

  /*const AnaSayfa({Key? key, required this.title}) : super(key: key);

  final String title;*/

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with TickerProviderStateMixin {


  var sayfaListe = [
    YeniGrup(),
    Kisiler(),
    Aramalar(),
    YakindakiKisiler(),
    KayitliMesajlar(),
    Ayarlar(),
    ArkadaslariniziDavetEdin(),
    TelegramOzellikleri(),
    Mesajlar(),];
  int secilenIndex = 8;

  bool arama = false;

  late AnimationController animasyonKontrol;
  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;
  bool fabDurum = false;

  bool isik = false;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    scaleAnimasyonDegerleri = Tween(begin: 0.0, end: 1.0).animate(animasyonKontrol)..addListener(() {
      setState(() {});
    });

    rotateAnimasyonDegerleri = Tween(begin: 0.0, end: pi*2).animate(animasyonKontrol)..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71a6d2),
        title: arama ?
            TextField(
              decoration: InputDecoration(hintText: "Bul"),
              onChanged: (arama){
                print("Arama sonucu = $arama");
              },
            )
            :
            Text("Telegram"),
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
      body: sayfaListe[secilenIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/resimler/ben.jpg'),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.flashlight_on_outlined),
                          Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
                            _themeManager.toggleTheme(newValue);
                          }),
                          Icon(Icons.flashlight_off_outlined),

                          /*IconButton(icon: Icon(Icons.mode_night, color: Colors.white,), onPressed: (){
                          },),*/
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text("Berkan", style: TextStyle(color: Colors.white,fontSize: 17),),
                  Text("+90 (544) 587 66 55", style: TextStyle(color: Colors.white60),),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF71a6d2),
              ),
            ),


            ListTile(
              title: Text("Yeni Grup"),
              leading: Icon(Icons.group,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 0;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Kişiler"),
              leading: Icon(Icons.person,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 1;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Aramalar"),
              leading: Icon(Icons.call,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 2;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Yakındaki Kişiler"),
              leading: Icon(Icons.nature_people,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 3;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Kayıtlı Mesajlar"),
              leading: Icon(Icons.bookmark_border,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 4;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Ayarlar"),
              leading: Icon(Icons.settings,size: 35,),
              trailing: Icon(Icons.feedback_outlined),
              onTap: (){
                setState(() {
                  secilenIndex = 5;
                });
                Navigator.pop(context);
              },
            ),

            Divider(
              color: Colors.blueGrey,
            ),

            ListTile(
              title: Text("Arkadaşlarınızı Davet Edin"),
              leading: Icon(Icons.person_add,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 6;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Telegram Özellikleri"),
              leading: Icon(Icons.contact_support_outlined,size: 35,),
              onTap: (){
                setState(() {
                  secilenIndex = 7;
                });
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),






      floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: rotateAnimasyonDegerleri.value,
              child: FloatingActionButton(
                backgroundColor: Color(0xFF71a6d2),
                onPressed: (){
                  if(fabDurum){
                    animasyonKontrol.reverse();
                    fabDurum = false;
                  }else{
                    animasyonKontrol.forward();
                    fabDurum = true;
                  }
                },
                tooltip: 'Yeni Mesaj',
                child: const Icon(Icons.create,size: 27,),
              ),
            ),
          ],
        ),
    );
  }
}



