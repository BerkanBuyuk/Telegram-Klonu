import 'package:flutter/material.dart';
import 'package:telegram_klonu/BirUlkeSeciniz.dart';

class KisiEkle extends StatefulWidget {
  const KisiEkle({Key? key}) : super(key: key);

  @override
  _KisiEkleState createState() => _KisiEkleState();

}

class _KisiEkleState extends State<KisiEkle> {


  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();
  var tfController3 = TextEditingController()..text = "Turkey";
  var tfController4 = TextEditingController()..text = '+90';
  var tfController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF71a6d2),
        centerTitle: false,
        title: Text("Kişi Ekle"),
        actions: [
          IconButton(icon: Icon(Icons.done), onPressed: (){

          },)
        ],
      ),

      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: ekranGenisligi/13,
                    backgroundColor: Color(0xFF71a6d2),
                  ),
                  Column(
                    children: [

                      SizedBox(
                        width: ekranGenisligi/2,
                        //height: ekranYuksekligi/10,
                        child: TextField(
                          controller: tfController1,
                          decoration: InputDecoration(
                            hintText: "Ad (zorunlu)",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            filled: false,
                          ),
                          autofocus: true,
                        ),
                      ),

                      SizedBox(
                        width: ekranGenisligi/2,
                        //height: ekranYuksekligi/10,
                        child: TextField(
                          controller: tfController2,
                          decoration: InputDecoration(
                            hintText: "Soyad (isteğe bağlı)",
                            hintStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            filled: false,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController3,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  filled: false,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BirUlkeSeciniz()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: ekranGenisligi/8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: tfController4,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        filled: false,
                      ),
                    ),
                  ),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: ekranGenisligi/1.3,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: tfController5,
                        decoration: InputDecoration(
                          hintText: "- - -   - - -   - - - -",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                          filled: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
