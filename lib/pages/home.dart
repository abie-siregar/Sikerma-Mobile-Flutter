import 'package:flutter/material.dart';
import 'package:sikerma/pages/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sikerma',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: IconButton(
                icon: const Icon(Icons.input_rounded),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
          backgroundColor: Colors.blueAccent[400],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                ),

                //Image
                Image.asset(
                  'lib/images/Poltek.jpg',
                  height: 200,
                  width: 250,
                ),
                SizedBox(height: 20),
                Text(
                  'Sikerma adalah sistem kerjasama polibatam,\n yang bertujuan untuk melakukan kerja sama \n dalam proyek pendidikan',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
