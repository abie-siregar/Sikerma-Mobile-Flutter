import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _Project();
}

class _Project extends State<Project> {
  List _listdata = [];

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost/sikerma/php/getdataproject.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (item) {}
  }

  @override
  void initState() {
    _getData();
    //print(_listdata);
    super.initState();
  }

  SingleChildScrollView _tableProject() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Nama Project")),
              DataColumn(label: Text("Mitra")),
              DataColumn(label: Text("Status")),
            ],
            rows: _listdata
                .map((item) => DataRow(cells: <DataCell>[
                      DataCell(Text(item["id_project"])),
                      DataCell(Text(item["nama_project"])),
                      DataCell(Text(item["mitra"])),
                      DataCell(Text(item["status"])),
                    ]))
                .toList()),
      ),
    );
  }

  String searchValue = '';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          backgroundColor: Colors.blueAccent[400],
          title: const Text(
            'Project',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text('Project',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center),
          ),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text(
              'Mahasiswa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text(
              'Dosen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.task_outlined),
            title: const Text(
              'Project',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          const Divider(color: Colors.black),
        ],
      )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              "List Project",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            _tableProject()
          ],
        ),
      ),
    );
  }
}
