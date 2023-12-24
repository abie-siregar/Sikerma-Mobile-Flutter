import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:sikerma/admin/mahasiswa.dart';
import 'package:sikerma/admin/dosen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
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
            'Dashboard',
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
            child: Text('Dashboard',
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
              Navigator.push(
                  context,
                  //routing into add page
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
            leading: const Icon(Icons.pages_outlined),
            title: const Text(
              'Pages',
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
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 150),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                height: 100,
                width: 100,
                child: const Center(child: Text('Mahasiswa'))),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                height: 100,
                width: 100,
                child: const Center(child: Text('Dosen'))),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                height: 100,
                width: 100,
                child: const Center(child: Text('Project'))),
          ],
        ),
      ),
    );
  }
}
