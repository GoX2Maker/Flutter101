import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix2/models/webtoon_Model.dart';

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webttons = jsonDecode(response.body);
      for (var webtoon in webttons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }

    throw Error();
  }
}
