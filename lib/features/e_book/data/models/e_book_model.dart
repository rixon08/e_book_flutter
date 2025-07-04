import 'package:e_book_flutter/features/e_book/data/helpers/number_helper.dart';
import 'package:e_book_flutter/features/e_book/data/models/author_model.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:fnv/fnv.dart';

part 'e_book_model.g.dart';

@collection
class EBookModel extends Equatable {
  @Index(unique: true, replace: true)
  int bookId;
  Id get isarId => fnv1a_32_s(bookId.toString());
  String title;
  List<AuthorModel> authors;
  List<String> summaries;
  List<AuthorModel> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool copyright;
  String imageLink;
  int downloadCount;

  String get downloadCountFormat => NumberHelper.addSeparator(downloadCount);
  String get summaryText  => summaries.join(". ");
  String get authorNames => authors.map((e) => e.name ?? "").join(", ");

  EBookModel({
    required this.bookId,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.imageLink,
    required this.downloadCount,
  });

  factory EBookModel.fromJson(Map<String, dynamic> json) => EBookModel(
        bookId: json["id"],
        title: json["title"],
        authors:
            List<AuthorModel>.from(json["authors"].map((x) => AuthorModel.fromJson(x))),
        summaries: List<String>.from(json["summaries"].map((x) => x)),
        translators: List<AuthorModel>.from(
            json["translators"].map((x) => AuthorModel.fromJson(x))),
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        languages: List<String>.from(json["languages"].map((x) => x)),
        copyright: json["copyright"],
        imageLink: json["formats"]["image/jpeg"],
        downloadCount: json["download_count"],
      );

  static List<EBookModel> fromJsonList(List? json) {
    return json?.map((e) => EBookModel.fromJson(e)).toList() ?? [];
  }
  
  @override
  List<Object?> get props => [bookId];


}
