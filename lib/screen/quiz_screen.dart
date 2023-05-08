import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aplikasi_flutter_pemula/model/score.dart';
import 'package:aplikasi_flutter_pemula/model/animal.dart';
import 'package:aplikasi_flutter_pemula/api/animal_api.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({Key? key}) : super(key: key);

  final String type = Random().nextInt(2) == 0 ? "dog" : "cat";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("CAT KNOWLEDGE TEST"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          leading: BackButton(
            color: Colors.white,
            onPressed: () => context.goNamed("home"),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: FutureBuilder<List<Animal>>(
                    future: AnimalApi().getAnimal(type: type),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(snapshot.data![index].url),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                const Text(
                  "IS THIS A CAT?",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          "YES",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          score.answer();
                          if (type == "cat") {
                            score.valid();
                            Fluttertoast.showToast(
                                msg: "JAWABAN BENAR!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webShowClose: true,
                                webBgColor:
                                    "linear-gradient(to right, #4CAF50, #4CAF50)");
                          } else {
                            Fluttertoast.showToast(
                                msg: "JAWABAN SALAH!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webShowClose: true,
                                webBgColor:
                                    "linear-gradient(to right, #F44336, #F44336)");
                          }
                          context.goNamed("home");
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text(
                          "NO",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          score.answer();
                          if (type == "dog") {
                            score.valid();
                            Fluttertoast.showToast(
                                msg: "JAWABAN BENAR!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webShowClose: true,
                                webBgColor:
                                    "linear-gradient(to right, #4CAF50, #4CAF50)");
                          } else {
                            Fluttertoast.showToast(
                                msg: "JAWABAN SALAH!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                webShowClose: true,
                                webBgColor:
                                    "linear-gradient(to right, #F44336, #F44336)");
                          }
                          context.goNamed("home");
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
