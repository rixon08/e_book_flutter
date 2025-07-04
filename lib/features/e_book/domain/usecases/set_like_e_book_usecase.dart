import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';

class SetLikeEBookUsecase {
  final LikedEBookRepository repository;

  SetLikeEBookUsecase(this.repository);

  Future<void> execute({required int bookId, required bool isLiked}) async {
    await repository.setIsLikedEBook(bookId: bookId, isLiked: isLiked);
  }
}