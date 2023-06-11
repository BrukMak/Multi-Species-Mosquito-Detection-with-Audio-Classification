import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mosdetector/core/error/exception.dart';
import 'package:mosdetector/core/utils/base_url.dart';

import '../models/mosquito_model.dart';
import 'package:http/http.dart' as http;

import 'local_source.dart';

abstract class MosquitoRemoteDataProvider {
  Future<MosquitoModel> detectedMosquito(String audio);
}

class MosquitoRemoteDataProviderImpl implements MosquitoRemoteDataProvider {
  final http.Client client;
  final String baseUrl = getBaseUrl();
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

      if (response.statusCode == 200) {
        var model = MosquitoModel.fromJson(jsonDecode(curResponse.body));
        await ShardPrefHelper.addMosquito(model);
        return model;
      }

      throw ServerException();
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
