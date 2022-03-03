import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pok_api/core/constants/my_api.dart';
import 'package:pok_api/models/pokemon_model.dart';

class PokemonsService {
  static Future<PokemonsModel> getData() async {
    Response res = await Dio().get(Constants.myApi);
    return PokemonsModel.fromJson(jsonDecode(res.data));
  }
}
