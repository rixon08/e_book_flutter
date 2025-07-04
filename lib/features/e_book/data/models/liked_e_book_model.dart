import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:isar/isar.dart';

part 'liked_e_book_model.g.dart';

@collection
class LikedEBookModel {
  Id id = Isar.autoIncrement;
  int bookId;
  DateTime likedAt = DateTime.now();

  LikedEBookModel(this.bookId);
}