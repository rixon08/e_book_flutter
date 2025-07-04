import 'package:isar/isar.dart';

part 'author_model.g.dart';

@embedded
class AuthorModel {
  String? name;
  int? birthYear;
  int? deathYear;

  AuthorModel({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
      );
}