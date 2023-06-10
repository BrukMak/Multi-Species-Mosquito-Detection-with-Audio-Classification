import "dart:convert";

import "package:mosdetector/features/mosqiuto/data/models/mosquito_model.dart";
import "package:shared_preferences/shared_preferences.dart";

class ShardPrefHelper {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<List<MosquitoModel>> getMosquitos(String name) async {
    final SharedPreferences prefs = await _instance;
    List<String>? mosList = prefs.getStringList(name);
    mosList ??= <String>[];
    final List<MosquitoModel> models =
        mosList.map((e) => MosquitoModel.fromJson(jsonDecode(e))).toList();
    return models;
  }

  static Future<bool> addMosquito(MosquitoModel mosquito) async {
    final SharedPreferences prefs = await _instance;
    List<String>? mosList = prefs.getStringList(mosquito.name);
    mosList ??= <String>[];
    final String mosStr = jsonEncode(mosquito.toJson());
    mosList.add(mosStr);
    return prefs.setStringList(mosquito.name, mosList);
  }



  static Future<bool> clear() async {
    final SharedPreferences prefs = await _instance;
    return prefs.clear();
  }
}
