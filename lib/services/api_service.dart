// Flutter 위젯이나 클래스가 아님
// 그냥 평범한 Dart 클래스
import 'dart:convert';
import 'package:http/http.dart';
import 'package:toonflix_webapp/models/webtoon_model.dart';
import 'package:toonflix_webapp/models/webtoon_detail_model.dart';
import 'package:toonflix_webapp/widgets/webtoon_widget.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonDetailModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonDetailModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonDetailModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
