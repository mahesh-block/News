import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'repositary.dart';

import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/v0/maxitem.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_root/v0/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
