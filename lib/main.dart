import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:telegram_klonu/KisilerCevap.dart';
import 'package:telegram_klonu/KisilerConstructor.dart';
import 'package:telegram_klonu/NavigationDrawerWidget.dart';
import 'package:telegram_klonu/theme/ThemeConstans.dart';
import 'package:telegram_klonu/theme/ThemeManager.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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
      setState(() {});
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

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with TickerProviderStateMixin {


  bool arama = false;

  late AnimationController animasyonKontrol;
  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;
  bool fabDurum = false;


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

  List<KisilerConstructor> parseKisilerCevap(String cevap){
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<KisilerConstructor>> tumKisileriGoster() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<bool> uygulamayiKapat() async{
    await exit(0);
  }



  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71a6d2),
        title: arama ?
        TextField(
          decoration: InputDecoration(hintText: "Bul"),
          onChanged: (arama) {
            print("Arama sonucu = $arama");
          },
        )
            :
        Text("Telegram"),
        actions: [
          arama ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                arama = false;
              });
            },
          )
              :
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Arama iconu",
            onPressed: () {
              setState(() {
                arama = true;
              });
            },
          ),
          //Icon(Icons.flashlight_on_outlined),
          Switch(value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              }),
          //Icon(Icons.flashlight_off_outlined),
        ],
      ),
      drawer: NavigationDrawerWidget(),
      body: WillPopScope(
        onWillPop: uygulamayiKapat,
        child: FutureBuilder<List<KisilerConstructor>>(
          future: tumKisileriGoster(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var kisilerListesi = snapshot.data;
              return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context, indeks){
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: (){},
                    child: Card(
                      child: SizedBox(
                        height: ekranYuksekligi/9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(kisi.kisi_ad),
                                    Text(kisi.kisi_tel),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return Center(child: Text("VERİ YOK", style: TextStyle(fontSize: 30),),);
            }
          },
        ),
      ),


      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform.rotate(
            angle: rotateAnimasyonDegerleri.value,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF71a6d2),
              onPressed: () {
                if (fabDurum) {
                  animasyonKontrol.reverse();
                  fabDurum = false;
                } else {
                  animasyonKontrol.forward();
                  fabDurum = true;
                }
              },
              tooltip: 'Yeni Mesaj',
              child: const Icon(Icons.create, size: 27,),
            ),
          ),
        ],
      ),
    );
  }
}



