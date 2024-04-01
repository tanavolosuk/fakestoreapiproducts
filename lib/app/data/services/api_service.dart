import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fakestoreapiproducts/app/data/models/apiResponse/api_response.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  Dio client = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<ApiResponse<T>> get<T>(String url) async {
    try {
      var randomInt = Random().nextInt(100) % 3;
      if (randomInt == 0) {
        await Future.delayed(const Duration(seconds: 2));
        throw 'Random error';
      }
      var response = await client.get(url);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return ApiResponse.failed(e.message ?? 'Dio error', e.error);
    } catch (e) {
      printError(info: e.toString());
      return ApiResponse.failed(e.toString(), e);
    }
  }

  Future<ApiService> init() async {
    return this;
  }
}
