import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/model/newsdata.dart';

class news {
  static String url = "https://newsapi.org/v2/everything?q=";
  getNewsList(String query) async {
    var response = await get(
        Uri.parse(url + query + "&apiKey=dfc1086625764212a62a52dcd53aef33"));
    if (response.statusCode == 200) {
      List<newsData> newsList;
      var result = json.decode(response.body);
      newsList = (result['articles'] as List)
          .map((e) => newsData.fromJson(e))
          .toList();
      return newsList;
    } else {
      print('error');
    }
  }
}
