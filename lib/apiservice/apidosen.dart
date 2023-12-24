import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sikerma/model/modeldosen.dart';

class Service {
  Future<List<dataDosen>> getAllData() async {
    final response = await http.get(Uri.parse('http://localhost/pbl/dosen'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => dataDosen.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost/pbl/dosen'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
