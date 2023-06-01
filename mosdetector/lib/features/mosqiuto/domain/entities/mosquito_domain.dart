
import 'package:equatable/equatable.dart';

class Mosquito  extends Equatable{
  String? id;
  String name;
  String description;
  String detectedTime;

  Mosquito({
    this.id,
    required this.name,
    required this.description,
    required this.detectedTime,
  });

  @override
  List<Object?> get props =>[id,name,description,detectedTime];

}