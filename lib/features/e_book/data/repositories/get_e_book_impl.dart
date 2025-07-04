import 'dart:convert';

import 'package:e_book_flutter/core/network/api_response.dart';
import 'package:e_book_flutter/core/network/dio_network.dart';
import 'package:e_book_flutter/core/network/network_info.dart';
import 'package:e_book_flutter/core/utils/injection.dart';
import 'package:e_book_flutter/features/e_book/data/datasources/e_book_local_source.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class GetEBookImpl extends EBookRepository {
  final DioNetwork dioNetwork = GetIt.instance<DioNetwork>();
  final EBookLocalSource local = GetIt.instance<EBookLocalSource>();
  final NetworkImpl network =  GetIt.instance<NetworkImpl>();

  @override
  Future<ApiResponse<List<EBookModel>?>> getDataEBook({String? param, String? searchKeyword}) async {
    if (await network.isConnected) {
      String paramUrl = "";
      if (param != null){
        paramUrl = param;
      } else if (searchKeyword != null){
        paramUrl = "?search=$searchKeyword";
      }
      final result = await dioNetwork.dioGet(paramUrl, (json) {
        if (json is List) {
          List<EBookModel> listEBook = EBookModel.fromJsonList(json);
          return listEBook;
        } else {
          return null;
        }
      }, {});
      if (result.data != null) {
        await local.saveOrUpdateBooks(result.data!);
      }
      return result;
    } else {
      final listData = await local.getAllBooks(searchKeyword: searchKeyword ?? "");
      return ApiResponse(count: listData.length, data: listData);
    }
  }
}
