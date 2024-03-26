import 'package:Finspire/data/nifty_data_model.dart';
import 'package:Finspire/data/stock_news_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Nifty>> fetchData() async {
    final url = Uri.parse(
        'https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%2050');
    final headers = {
      "X-RapidAPI-Key": "d033c46d64mshcb5a6b00ba175fcp1a2556jsn2f2eaa8d92dd",
      "X-RapidAPI-Host": "latest-stock-price.p.rapidapi.com",
    };

    var client = http.Client();

    var response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    } else {
      // Error handling
      print('Failed to load data: ${response.statusCode}');
      throw Exception("Failed to load data");
    }
  }

  Future<List<News>> fetchNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=de193c51792942f186b3c3036450f9c2');

    var client = http.Client();

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      return newsFromJson(json);
    } else {
      // Error handling
      print('Failed to load data: ${response.statusCode}');
      throw Exception("Failed to load data");
    }
  }
}
