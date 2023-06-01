import 'dart:convert';

import 'package:mosdetector/core/error/exception.dart';
import 'package:mosdetector/core/utils/base_url.dart';

import '../models/mosquito_model.dart';
import 'package:http/http.dart' as http;

abstract class MosquitoRemoteDataProvider {
  Future<MosquitoModel> detectedMosquito(String audio);
  Future<List<MosquitoModel>> getMosquitoes();
  Future<MosquitoModel> getMosquito(String id);
}

class MosquitoRemoteDataProviderImpl implements MosquitoRemoteDataProvider {
  final http.Client client;
  final String baseUrl = getBaseUrl();
  MosquitoRemoteDataProviderImpl({required this.client});

  @override
  Future<MosquitoModel> detectedMosquito(String audio) async {
    
    final response = await client.post(
      Uri.parse(baseUrl + "detect"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(audio)
    );   

    if (response.statusCode == 200){
      return MosquitoModel.fromJson(jsonDecode(response.body)["data"]);
    }

    throw ServerException();
  }

  @override
  Future<MosquitoModel> getMosquito(String id) async {
    final response = await client.get(Uri.parse(baseUrl + id), 
        headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        }
    );  

    if (response.statusCode == 200) {
      return MosquitoModel.fromJson(jsonDecode(response.body)["data"]);
    }
    
    throw ServerException();

  }

  @override
  Future<List<MosquitoModel>> getMosquitoes() async {
    
    final response = await client.get(Uri.parse(baseUrl), 
        headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        }
    );  

    if (response.statusCode == 200) {
      List<dynamic> reponseData = jsonDecode(response.body)["data"] ?? [];
      return reponseData.map((e) => MosquitoModel.fromJson(e)).toList();
    }
    
    throw ServerException();

  }
}
