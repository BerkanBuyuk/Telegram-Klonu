import 'package:telegram_klonu/KisilerConstructor.dart';

class KisilerCevap {
  int success;
  List<KisilerConstructor> kisilerListesi;

  KisilerCevap(this.success, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String, dynamic> json){
    var jsonArray = json["kisiler"] as List;
    List<KisilerConstructor> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => KisilerConstructor.fromJson(jsonArrayNesnesi)).toList();
    return KisilerCevap(json["success"] as int, kisilerListesi);
  }
}