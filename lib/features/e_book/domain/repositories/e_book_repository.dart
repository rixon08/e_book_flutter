import 'package:e_book_flutter/core/network/api_response.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';

abstract class EBookRepository {
  Future<ApiResponse<List<EBookModel>?>> getDataEBook({String? param, String? searchKeyword});
}