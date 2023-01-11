import 'package:ako_test/src/core/dio/dio_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio _dio;
  late DioAdapter _dioAdapter;

  late DioRequest _dioRequest;

  const url = "https://www.google.com";

  setUp(() {
    _dio = Dio();
    _dioAdapter = DioAdapter(dio: _dio);

    _dio.httpClientAdapter = _dioAdapter;

    _dioRequest = DioRequest(_dio);
  });

  test("get dio request test", () async {
    _dioAdapter.onGet(url, (server) {
      return server.reply(200, {'message': 'success'},
          delay: Duration(milliseconds: 300));
    });
    final response = await _dioRequest.get(url);
    expect(response.data, isMap);
    expect(response.data['message'], equals('success'));
  });
}
