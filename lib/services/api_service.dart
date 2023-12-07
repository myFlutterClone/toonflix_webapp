// Flutter 위젯이나 클래스가 아님
// 그냥 평범한 Dart 클래스
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final Response = await get(url);
    if (Response.statusCode == 200) {
      print(Response.body);
      return;
    }
    throw Error();
  }
}
