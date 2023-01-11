import 'package:ako_test/env.dart';
import 'package:ako_test/src/core/constants/constants.dart';
import 'package:ako_test/src/core/dio/dio_request.dart';
import 'package:ako_test/src/features/news/data/datasource/news_datasource.dart';
import 'package:ako_test/src/features/news/data/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

class MockDioRequest extends Mock implements DioRequest {}

var sampleJsonResponse = {
  "articles": [
    {
      "source": {"id": null, "name": "Tribunnews.com"},
      "author": "Amalia Husnul Arofiati",
      "title":
          "Cara Setting Proxy WhatsApp untuk bisa Chat WA tanpa Internet, bisa Dipakai di Android dan iPhone - MSN",
      "description":
          "Berikut ini cara setting proxy WhatsApp untuk bisa chat wa tanpa internet. Cek cara menyetel proxy WhatsApp untuk iPhone dan Android",
      "url":
          "https://kaltim.tribunnews.com/2023/01/11/cara-setting-proxy-whatsapp-untuk-bisa-chat-wa-tanpa-internet-bisa-dipakai-di-android-dan-iphone",
      "urlToImage":
          "https://cdn-2.tstatic.net/kaltim/foto/bank/images/Cara-Setting-Proxy-WhatsApp-untuk-bisa-Chat-WA-tanpa-Internet-bisa-Dipakai-di-Android-dan-iPhone.jpg",
      "publishedAt": "2023-01-10T22:06:48Z",
      "content":
          "TRIBUNKALTIM.CO - Berikut ini cara setting proxyWhatsApp untuk bisa chat wa tanpa internet.\r\nCek cara menyetel proxyWhatsApp untuk iPhone dan Android yang saat ini tengah ramai dibahas pengguna WA.\r\n… [+1205 chars]"
    },
  ]
};

var sampleEverythingJson = {
  "articles": [
    {
      "source": {"id": null, "name": "Gizmodo.com"},
      "author": "Lucas Ropek",
      "title":
          "OG Bitcoin Core Developer Claims Hack Drained Nearly All His BTC",
      "description":
          "Even cryptocurrency’s most accomplished tech wizards apparently aren’t immune from the occasional wallet-draining hack. Luke Dashjr, one of the original core developers for Bitcoin, claims that someone swiped hundreds of BTC from his accounts late last year—l…",
      "url":
          "https://gizmodo.com/bitcoin-price-hack-217-btc-og-developer-luke-dashjr-1849944799",
      "urlToImage":
          "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/c8e3b3fe0595dfbab3656a5ba0e06e2c.jpg",
      "publishedAt": "2023-01-03T20:48:00Z",
      "content":
          "Even cryptocurrencys most accomplished tech wizards apparently arent immune from the occasional wallet-draining hack. Luke Dashjr, one of the original core developers for Bitcoin, claims that someone… [+2723 chars]"
    }
  ]
};
void main() {
  late NewsDatasource _datasource;
  late DioRequest _dioRequest;

  late Dio _dio;
  late DioAdapter _dioAdapter;

  var topHeadlinesUrl = "$apiurl/top-headlines";
  var everythingUrl = "$apiurl/everything";

  setUp(() {
    _dio = Dio();
    _dioAdapter = DioAdapter(dio: _dio);

    _dio.httpClientAdapter = _dioAdapter;
    _dioRequest = DioRequest(_dio);

    _datasource = NewsDatasourceImpl(_dioRequest);
  });

  group("Fetch News datasource test", () {
    test("fetch top-headlines news datasource test", () async {
      var param = {
        "country": "id",
        "apiKey": Env.newsApiKey,
      };
      _dioAdapter.onGet(topHeadlinesUrl, (server) {
        return server.reply(
          200,
          sampleJsonResponse,
        );
      }, queryParameters: param);

      final model = await _datasource.fetch();
      expect(model, isList);
      expect(model, isA<List<NewsModel>>());
      expect(model?.length, equals(1));
      expect(
          model?[0].title,
          equals(
              "Cara Setting Proxy WhatsApp untuk bisa Chat WA tanpa Internet, bisa Dipakai di Android dan iPhone - MSN"));
    });

    test("fetch everything news datasource test", () async {
      var param = {
        "q": "bitcoin",
        "apiKey": Env.newsApiKey,
      };
      _dioAdapter.onGet(everythingUrl, (server) {
        return server.reply(
          200,
          sampleEverythingJson,
        );
      }, queryParameters: param);

      final model = await _datasource.fetch(query: param['q']);
      expect(model, isList);
      expect(model, isA<List<NewsModel>>());
      expect(model?.length, equals(1));
      expect(
          model?[0].title,
          equals(
              "OG Bitcoin Core Developer Claims Hack Drained Nearly All His BTC"));
    });
  });
}
