import 'dart:math';
import 'package:flutter/material.dart';
import 'package:telegram_klonu/NavigationDrawerWidget.dart';
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



  @override
  Widget build(BuildContext context) => Scaffold(
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
          //Icon(Icons.flashlight_on_outlined),
          Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
            _themeManager.toggleTheme(newValue);
          }),
          //Icon(Icons.flashlight_off_outlined),
        ],
      ),
      drawer: NavigationDrawerWidget(),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Center(),
        ),
      ),




      floatingActionButton: Column(
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



