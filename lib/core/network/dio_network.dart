import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_book_flutter/core/network/api_response.dart';
import 'package:e_book_flutter/core/utils/constants/network.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum DioNetworkType {
  post,
  get,
}

class DioNetwork {
  late Dio dioClient;

  DioNetwork() {
    dioClient = Dio(BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null &&
              status < 600; // Tetap lanjut jika status < 500
        }));
  }

  Future<ApiResponse<T>> dioPost<T>(
      String url, T Function(dynamic) fromJsonT, Map<String, dynamic> param,
      {int timeOut = 30000}) async {
    return dioSendToAPI(url, fromJsonT, param, DioNetworkType.post, timeOut: timeOut);
  }

  Future<ApiResponse<T>> dioGet<T>(
      String url, T Function(dynamic) fromJsonT, Map<String, dynamic> param,
      {int timeOut = 30000}) async {
    return dioSendToAPI(url, fromJsonT, param, DioNetworkType.get, timeOut: timeOut);
  }

  printLog(String _title, String _message) {
    log('╔ $_title ══════════');
    log('║ $_message');
    log('╚══════════════════════════════════════════════════════════════════════════════════════════');
  }

  Future<ApiResponse<T>> dioSendToAPI<T>(
      String url,
      T Function(dynamic) fromJsonT,
      Map<String, dynamic> param,
      DioNetworkType type,
      {int timeOut = 30000}) async {
    String paramStr = "";

    if (type == DioNetworkType.get) {
      param.forEach((key, value) {
        paramStr += ("$key=${Uri.encodeComponent(value.toString())}&");
      });

      // printLog('DioConn', 'Url = $url param: $paramStr');
    }

    Options options = Options(
        receiveTimeout: Duration(milliseconds: timeOut),
        sendTimeout: Duration(milliseconds: timeOut));
    // if (options != null) {
    //   dioClient.options.headers = options.headers;
    //   dioClient.options.responseType = ResponseType.plain;
    // }
    // dioClient.interceptors.add(
    //   PrettyDioLogger(
    //     request: false, //true,
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: false,
    //     responseBody: false, //true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90,
    //   ),
    // );

    DateTime start = DateTime.now();

    Response? response;
    try {

      if (type == DioNetworkType.get) {
        response = await dioClient.get(
          url,
          queryParameters: param,
          options: options,
        ); // json.decode(paramStr));
      } else {
        response = await dioClient.post(
          url,
          data: param,
          options: options,
        );
      }
      try {
        Map<String, dynamic> json = jsonDecode(response.toString());
        printLog('DioConn ║ Response ', 'Url = $url');
        Logger().d(jsonDecode(response.toString()));
        if (json.toString() != "[]") {
          if (json["status_code"].toString().toUpperCase() ==
              "false".toUpperCase()) {}
        }
      } catch (e) {}
    } on DioException catch (e) {
      debugPrint(
          "Dio Get $url $param Error: $e.type - $e.error Response: $e.response");
      return ApiResponse(isSuccess: false);
    } catch (e) {
      debugPrint("Dio Get $url $param Error: $e");
      return ApiResponse(isSuccess: false);
    }

    // print('Url = ' + url + ' / ' + paramStr + ' / ' + (DateTime.now().difference(start)).toString() + ' / ' + response.toString());

    printLog('DioConn ║ Time',
        'Url = $url / $paramStr / ${DateTime.now().difference(start)}');

    return ApiResponse.fromJson(response.data, fromJsonT);
  }
}