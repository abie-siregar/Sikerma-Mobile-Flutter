// ignore_for_file: unused_field, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDosen extends StatefulWidget {
  const AddDosen({Key? key}) : super(key: key);

  @override
  State<AddDosen> createState() => _AddState();
}

class _AddState extends State<AddDosen> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier valueNotifier = ValueNotifier("initial");

  //inisialize field
  var nidn = TextEditingController();
  var nama = TextEditingController();
  var jurusan = TextEditingController();
  var email = TextEditingController();
  var username = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://localhost/pbl/dosen"),
        body: {
          'nidn': nidn,
          'nama': nama,
          'email': email,
          'username': username,
          'jurusan': jurusan,
        },
      ).then((value) {
        //print message after insert to database
        //you can improve this message with alert dialog
        var data = jsonDecode(value.body);
        print(data["message"]);

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Dosen"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (BuildContext context, values, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIDN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: nidn,
                      decoration: InputDecoration(
                          hintText: "NIDN",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'NIDN is Required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Nama',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: nama,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Nama',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama is Required!';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is Required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Jurusan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: jurusan,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Jurusan',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Jurusan is Required!';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: username,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Jurusan is Required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        //validate
                        if (_formKey.currentState!.validate()) {
                          //send data to database with this method
                          _onSubmit();
                        }
                      },
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
