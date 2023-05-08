import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aplikasi_flutter_pemula/model/animal.dart';
import 'package:aplikasi_flutter_pemula/api/animal_api.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  var listCat = AnimalApi().getAnimal(type: "cat", number: 2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RANDOM PICTURE OF CATS"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          leading: BackButton(
            color: Colors.white,
            onPressed: () => context.goNamed("home"),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  listCat = AnimalApi().getAnimal(type: "cat", number: 2);
                });
              },
            )
          ],
        ),
        body: FutureBuilder<List<Animal>>(
          future: listCat,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data![index].url),
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
    );
  }
}
