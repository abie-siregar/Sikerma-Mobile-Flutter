class dataDosen {
  String dnidn;
  String dnama;
  String djurusan;
  String demail;
  String dusername;

  dataDosen({
    required this.dnidn,
    required this.dnama,
    required this.djurusan,
    required this.demail,
    required this.dusername,
  });

  factory dataDosen.fromJson(Map<String, dynamic> json) {
    return dataDosen(
      dnidn: json['nidn'],
      dnama: json['nama'],
      djurusan: json['jurusan'],
      demail: json['email'],
      dusername: json['username'],
    );
  }
}
