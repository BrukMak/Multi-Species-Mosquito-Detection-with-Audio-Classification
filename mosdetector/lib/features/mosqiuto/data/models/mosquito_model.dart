import '../../domain/entities/mosquito_domain.dart';

class MosquitoModel {
  final String name;
  String time;
  MosquitoModel(
      {required this.name, required this.time });

  factory MosquitoModel.fromJson(Map<String, dynamic> json) {
    return MosquitoModel(
        name: json["name"],
        time: DateTime.now().toString(),
      );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "time": time,
    };
  }
}
