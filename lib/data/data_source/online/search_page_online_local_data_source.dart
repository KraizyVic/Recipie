import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:recipa/data/models/search_page_model.dart';


class SearchPageOnlineLocalDataSource{
  final String searchUrl = "https://www.allrecipes.com/search";
  Future<SearchPageModel> search(String query) async{
    final response = await http.get(Uri.parse("$searchUrl?q=$query"));
    if(response.statusCode == 200){
      final Document document = parser.parse(response.body);
      return SearchPageModel.fromHtml(document);
    }else{
      throw Exception("Failed to load search page");
    }
  }

  Future<SearchPageModel> nextPage(String url) async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final Document document = parser.parse(response.body);
      return SearchPageModel.fromHtml(document);
    }else{
      throw Exception("Failed to load next page");
    }
  }
}