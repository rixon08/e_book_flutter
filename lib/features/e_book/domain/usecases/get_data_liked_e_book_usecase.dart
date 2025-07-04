import 'package:dartz/dartz.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/data/models/liked_e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';

class GetDataLikedEBookUsecase {
  final LikedEBookRepository repository;

  GetDataLikedEBookUsecase(this.repository);

  Future<List<EBookModel>> execute({String search = ""}) async {
    return await repository.getDataLikedEBook(searchKeyword: search);
  }
}