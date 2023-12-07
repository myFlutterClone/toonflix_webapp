// Flutter 위젯이나 클래스가 아님
// 그냥 평범한 Dart 클래스
import 'dart:convert';
import 'package:http/http.dart';
import 'package:toonflix_webapp/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final Response = await get(url);
    if (Response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(Response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
