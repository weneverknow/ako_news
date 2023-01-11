import 'package:dio/dio.dart';

class DioRequest {
  final Dio dio;
  DioRequest(this.dio);

  Future<Response> get(String url,
      {Map<String, dynamic>? params, bool authenticated = true}) async {
    return await dio.get(url, queryParameters: params);
  }
}
