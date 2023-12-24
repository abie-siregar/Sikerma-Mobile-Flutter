import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:sikerma/admin/mahasiswa.dart';
import 'package:sikerma/admin/project.dart';
import 'package:sikerma/apiservice/apidosen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sikerma/admin/add/adddosen.dart';
import 'package:sikerma/model/modeldosen.dart';
import 'package:sikerma/pages/home.dart';

class Dosen extends StatefulWidget {
  const Dosen({super.key});

  @override
  State<Dosen> createState() => _Dosen();
}

class _Dosen extends State<Dosen> {
  Service serviceAPI = Service();
  late Future<List<dataDosen>> listData;

  @override
  void initState() {
    super.initState();

    listData = serviceAPI.getAllData();
  }

  String searchValue = '';
  final List<String> _suggestions = [
    'Messi',
    'Ronaldo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          backgroundColor: Colors.blueAccent[400],
          title: const Text(
            'List Dosen',
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
            child: Text('Dosen',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center),
          ),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text(
              'Mahasiswa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Mahasiswa()));
            },
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text(
              'Dosen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Project()));
            },
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
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
              List<dataDosen> isiData = snapshot.data!;
              return ListView.builder(
                itemCount: isiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].dnama),
                      subtitle: Text(isiData[index].dnidn),
                      onLongPress: () {
                        deleteData(isiData[index].dnidn);
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
              context,
              //routing into add page
              MaterialPageRoute(builder: (context) => const AddDosen()));
        },
      ),
    );
  }

  void deleteData(String nidn) async {
    bool response = await serviceAPI.deleteData(nidn);
    if (response == true) {
      setState(() {
        listData = serviceAPI.getAllData();
      });
    } else {
      log("Error data gagal di hapus");
    }
  }
}
