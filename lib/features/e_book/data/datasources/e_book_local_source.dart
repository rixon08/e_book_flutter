import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/data/models/liked_e_book_model.dart';
import 'package:isar/isar.dart';

class EBookLocalSource {
  final Isar isar;

  EBookLocalSource(this.isar);

  Future<void> saveOrUpdateBooks(List<EBookModel> books) async {
    await isar.writeTxn(() async {
      for (var book in books) {
        await isar.eBookModels.put(book);
      }
    });
  }

  Future<List<EBookModel>> getAllBooks({String searchKeyword = ""}) async {
    return await isar.eBookModels.filter()
    .titleContains(searchKeyword, caseSensitive: false).findAll();
  }

  Future<List<EBookModel>> getLikedBooks({String searchKeyword = ""}) async {
    final likedIds = await isar.likedEBookModels.where().sortByLikedAtDesc().bookIdProperty().findAll();
    final result = await isar.eBookModels
    .filter()
    .anyOf(likedIds, (q, id) => q.bookIdEqualTo(id))
    .titleContains(searchKeyword, caseSensitive: false)
    .findAll();
    return result;
  }

  Future<void> setIsLiked(int bookId) async {
    final liked = await isar.likedEBookModels
        .filter()
        .bookIdEqualTo(bookId)
        .findFirst();

    await isar.writeTxn(() async {
      if (liked != null) {
        await isar.likedEBookModels.delete(liked.id);
      } else {
        final like = LikedEBookModel(bookId);
        await isar.likedEBookModels.put(like);
      }
    });
  }

  Future<bool> isLiked(int bookId) async {
    final result = await isar.likedEBookModels
        .filter()
        .bookIdEqualTo(bookId)
        .findFirst();
    return result != null;
  }
}