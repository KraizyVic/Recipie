import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parse;
import 'package:recipa/data/models/recipe_article_page_model.dart';

class RecipeArticlePageOnlineDataSource{
  Future<ArticlePageModel> fetchRecipePageDetails(String recipeUrl) async {
    final response = await http.get(Uri.parse(recipeUrl));
    if(response.statusCode == 200){
      final document = parse.parse(response.body);
      return ArticlePageModel.fromHtml(document);
    }else{
      throw Exception("Something went wrong");
    }
  }
}