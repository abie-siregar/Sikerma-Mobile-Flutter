//ignore_for_file: unused_field, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable, unused_element, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sikerma/admin/dashboard.dart';
import 'package:sikerma/admin/mahasiswa.dart';
import 'package:sikerma/admin/dosen.dart';
import 'package:sikerma/admin/project.dart';
import 'package:sikerma/pages/login.dart';
import 'package:sikerma/pages/home.dart';
import 'package:sikerma/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
