import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:recipa/core/models/recipe_n_article_card_model.dart';
import 'package:recipa/data/models/home_page_model.dart';

class HomePageOnlineDataSource {
  final String homePageUrl = "https://www.allrecipes.com/";
  HomePageModel? _cachedHomePage; // Cache storage

  Future<HomePageModel> fetchHomePageDetails() async {
    // Return cached data if available
    if (_cachedHomePage != null) {
      print("Returning cached data");
      return _cachedHomePage!;
    }

    var response = await http.get(Uri.parse(homePageUrl));
    if (response.statusCode == 200) {
      Document document = parser.parse(response.body);
      _cachedHomePage = HomePageModel.fromHtml(document); // Cache the result
      return _cachedHomePage!;
    } else {
      throw Exception("Failed to load home page\nStatus Code: ${response.statusCode}");
    }
  }

  // Call this when you need to force refresh
  void clearCache() {
    _cachedHomePage = null;
  }
}