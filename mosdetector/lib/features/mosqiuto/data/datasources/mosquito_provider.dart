import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mosdetector/core/error/exception.dart';
import 'package:mosdetector/core/utils/base_url.dart';
import 'package:mosdetector/core/utils/constants.dart';

import '../models/mosquito_model.dart';
import 'package:http/http.dart' as http;

import 'local_source.dart';

abstract class MosquitoRemoteDataProvider {
  Future<MosquitoModel> detectedMosquito(String audio);
}

class MosquitoRemoteDataProviderImpl implements MosquitoRemoteDataProvider {
  final http.Client client;
  final String baseUrl = getBaseUrl();

  List<String> mosList = [nameA, nameB, nameC, nameD, nameE, nameF];

  MosquitoRemoteDataProviderImpl({required this.client});

  @override
  Future<MosquitoModel> detectedMosquito(String audio) async {
    Map<String, String> headers = {"Authorization": "Bearer "};
    var url = Uri.parse(baseUrl);
    var request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile.fromBytes(
        "file", File(audio).readAsBytesSync(),
        filename: audio));

    request.headers.addAll(headers);
    try {
      final response = await request.send();
      var curResponse = await http.Response.fromStream(response);
      print("returned" + curResponse.body);

      if (curResponse.statusCode == 200) {
        var model = MosquitoModel.fromJson(jsonDecode(curResponse.body));
        if (mosList.contains(model.name)) {
          await ShardPrefHelper.addMosquito(model);
        }
        return model;
      } 
      print("dsjfildsnkfmks,nfoislakfnxmpewislakfm feislfj ewoljfewp");
      print(curResponse.statusCode);
      print(curResponse.body);

      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
