class KisilerConstructor{
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  KisilerConstructor(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory KisilerConstructor.fromJson(Map<String, dynamic> json){
    return KisilerConstructor(json["kisi_id"] as String, json["kisi_ad"] as String, json["kisi_tel"] as String);
  }
}