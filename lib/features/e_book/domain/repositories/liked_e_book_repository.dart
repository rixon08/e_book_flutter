import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';

abstract class LikedEBookRepository {
  Future<List<EBookModel>> getDataLikedEBook({String searchKeyword = ""});
  
  Future<void> setIsLikedEBook({required int bookId, required  bool isLiked});

  Future<bool> isLikedEBook(int bookId);
  
}