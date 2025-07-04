import 'package:e_book_flutter/core/utils/injection.dart';
import 'package:e_book_flutter/features/e_book/data/datasources/e_book_local_source.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/data/models/liked_e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';
import 'package:get_it/get_it.dart';

class GetLikedEBookImpl extends LikedEBookRepository{

  final local = GetIt.instance<EBookLocalSource>();

  @override
  Future<List<EBookModel>> getDataLikedEBook({String searchKeyword = ""}) async {
    return await local.getLikedBooks(searchKeyword: searchKeyword);
  }
  
  @override
  Future<void> setIsLikedEBook({required int bookId, required bool isLiked}) async {
    await local.setIsLiked(bookId);
  }
  
  @override
  Future<bool> isLikedEBook(int bookId) async {
    return await local.isLiked(bookId);
  }
  
}