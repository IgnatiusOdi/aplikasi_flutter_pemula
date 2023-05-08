import 'package:aplikasi_flutter_pemula/model/score.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("IS THIS A CAT?"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  score.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset("assets/images/smilingcat.jpg",
                  width: 400, height: 400),
              const SizedBox(height: 32),
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black),
                  child: const Text(
                    "KNOWLEDGE TEST",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => context.goNamed("quiz"),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black),
                  child: const Text(
                    "RANDOM PICTURE OF CATS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => context.goNamed("cats"),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
