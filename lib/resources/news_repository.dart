import 'package:api_task/models/news_model.dart';
import 'package:http/http.dart' as http;


class NewsRepository {
  Future<List<Datum>> getNews() async {
    var response =
    await http.get(Uri.parse('https://api.first.org/data/v1/news'));
    if (response.statusCode == 200) {
      final parseData = newsFromMap(response.body);
      final news = parseData.data;
      return news;
    } else {
      throw Exception('Failed');
    }
  }
}