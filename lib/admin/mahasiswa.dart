import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:sikerma/apiservice/apiservice.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sikerma/admin/add/addmahasiswa.dart';
import 'package:sikerma/admin/dosen.dart';
import 'package:sikerma/model/model.dart';
import 'package:sikerma/pages/home.dart';

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({super.key});

  @override
  State<Mahasiswa> createState() => _Mahasiswa();
}

class _Mahasiswa extends State<Mahasiswa> {
  Service serviceAPI = Service();
  late Future<List<dataMahasiswa>> listData;

  @override
  void initState() {
    super.initState();

    listData = serviceAPI.getAllData();
  }

  String searchValue = '';
  final List<String> _suggestions = [
    'Ronaldo',
    'Messi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          backgroundColor: Colors.blueAccent[400],
          title: const Text(
            'Mahasiswa',
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
            child: Text('Mahasiswa',
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
            onTap: () {
              Navigator.push(
                  context,
                  //routing into add page
                  MaterialPageRoute(builder: (context) => const Dosen()));
            },
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
            onTap: () {
              Navigator.push(
                  context,
                  //routing into add page
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          const Divider(color: Colors.black),
        ],
      )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dataMahasiswa> isiData = snapshot.data!;
              return ListView.builder(
                itemCount: isiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].dnama),
                      subtitle: Text(isiData[index].dnim),
                      onLongPress: () {
                        deleteData(isiData[index].dnim);
                      },
                      trailing: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Add()));
        },
      ),
    );
  }

  void deleteData(String id) async {
    bool response = await serviceAPI.deleteData(id);
    if (response == true) {
      setState(() {
        listData = serviceAPI.getAllData();
      });
    } else {
      log("Error data gagal di hapus");
    }
  }
}
