import '../../domain/entities/mosquito_domain.dart';

class MosquitoModel extends Mosquito {
  MosquitoModel(
    String id, {
    required String name,
    required String description,
    required String detectedTime,
  }) : super(
            id: id,
            description: description,
            name: name,
            detectedTime: detectedTime);

  factory MosquitoModel.fromJson(Map<String, dynamic> json) {
    return MosquitoModel(
        json["id"],
        name: json["name"],
        description: json["description"],
        detectedTime: json["detectedTime"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "detectedTime": detectedTime,
    };
  }
}
