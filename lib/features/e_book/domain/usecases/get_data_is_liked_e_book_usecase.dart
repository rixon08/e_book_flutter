import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';

class GetDataIsLikedEBookUsecase {
  final LikedEBookRepository repository;

  GetDataIsLikedEBookUsecase(this.repository);

  Future<bool> execute(int bookId) async {
    return repository.isLikedEBook(bookId);
  }
}
