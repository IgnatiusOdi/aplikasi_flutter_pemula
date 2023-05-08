import 'dart:convert';
import 'package:http/http.dart';
import 'package:aplikasi_flutter_pemula/model/animal.dart';

const catAPI = "https://api.thecatapi.com/v1/images/search?limit=";
const dogAPI = "https://api.thedogapi.com/v1/images/search?limit=";

class AnimalApi {
  Future<List<Animal>> getAnimal({type = "cat", number = 1}) async {
    Response response;
    if (type == "dog") {
      response = await get(Uri.parse('$dogAPI$number'));
    } else {
      response = await get(Uri.parse('$catAPI$number'));
    }
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Animal.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
