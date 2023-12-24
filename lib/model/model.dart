class dataMahasiswa {
  String dnim;
  String dnama;
  String djurusan;
  String demail;
  String dusername;

  dataMahasiswa({
    required this.dnim,
    required this.dnama,
    required this.djurusan,
    required this.demail,
    required this.dusername,
  });

  factory dataMahasiswa.fromJson(Map<String, dynamic> json) {
    return dataMahasiswa(
      dnim: json['nim'],
      dnama: json['nama'],
      djurusan: json['jurusan'],
      demail: json['email'],
      dusername: json['username'],
    );
  }
}
