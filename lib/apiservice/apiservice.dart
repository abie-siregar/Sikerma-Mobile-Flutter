import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sikerma/model/model.dart';

class Service {
  Future<List<dataMahasiswa>> getAllData() async {
    final response =
        await http.get(Uri.parse('http://localhost/pbl/mahasiswa'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => dataMahasiswa.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future postData(
    String pnim,
    String pnama,
    String pjurusan,
    String pemail,
    String pusername,
  ) async {
    try {
      final response =
          await http.post(Uri.parse('http://localhost/pbl/mahasiswa'), body: {
        'nim': pnim,
        'nama': pnama,
        'jurusan': pnim,
        'email': pemail,
        'username': pusername,
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost/pbl/mahasiswa'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
