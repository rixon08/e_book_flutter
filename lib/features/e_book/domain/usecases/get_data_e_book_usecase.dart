import 'package:dartz/dartz.dart';
import 'package:e_book_flutter/core/network/api_response.dart';
import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/e_book_repository.dart';

class GetDataEBookUsecase {

  final EBookRepository repository;

  GetDataEBookUsecase(this.repository);
  
  Future<Either<String, ApiResponse<List<EBookModel>?>>> execute({String? param, String? searchKeyword}) async {
    try {
      final ebooks = await repository.getDataEBook(param: param, searchKeyword: searchKeyword);
      return !ebooks.isSuccess ? Left(AppStrings.errorMessage) : Right(ebooks);
    } catch (e) {
      return Left(e.toString());
    }
  }

}