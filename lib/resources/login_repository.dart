import 'package:api_task/models/auth.dart';
import 'package:http/http.dart' as http;


class LoginRepository {
  Future<List<Item>> getLogin() async {
    var url = 'http://localhost:8000';
    var response =
    await http.get(Uri.parse('https://www.postman.com/collections/299632c9a18ed457ba78'));
      final parseData = loginFromMap(response.body);
      final login = parseData.item;
      return login;

  }
}