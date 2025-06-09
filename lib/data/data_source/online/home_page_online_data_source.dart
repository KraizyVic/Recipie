import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:recipa/data/models/home_page_model.dart';

class HomePageOnlineDataSource{
  final String homePageUrl = "https://www.allrecipes.com/";
  Future<HomePageModel> fetchHomePageDetails() async{
    var response = await http.get(Uri.parse(homePageUrl));
    if(response.statusCode == 200){
      List<RandomRecipesModel> randomRecipes = [];
      List<RandomArticlesModel> randomArticles = [];

      Document document = parser.parse(response.body);
      Element? homePageElement = document.querySelector("body");

      List<Element> sections = homePageElement!.getElementsByClassName("comp mntl-three-post mntl-block");
      for(Element section in sections){
        List<Element> recipes = section.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card--image-top card card--no-image");
        for(Element recipe in recipes){
          randomRecipes.add(
              RandomRecipesModel(
                url: recipe.attributes['href'] ?? "null",
                title: recipe.querySelector("div.card__content > span.card__title > span.card__title-text")?.text.trim() ?? "null",
                category: recipe.querySelector("div.card__content")?.attributes['data-tag'] ?? "null",
                imageUrl: recipe.querySelector("img")?.attributes['src'] ?? recipe.querySelector("img")?.attributes['data-src'] ?? "null",
              )
          );
        }
      }
      List<Element> recipeArticlesSections = homePageElement.getElementsByClassName("comp mntl-vertical-list mntl-block").take(1).toList();
      for(Element section in recipeArticlesSections){
        List<Element> recipeArticles = section.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card--image-left card card--no-image");
        for(Element recipeArticle in recipeArticles){
          randomArticles.add(
              RandomArticlesModel(
                url: recipeArticle.attributes['href'] ?? "null",
                title: recipeArticle.querySelector("div.card__content > span.card__title > span.card__title-text")?.text.trim() ?? "null",
                category: recipeArticle.querySelector("div.card__content")?.attributes['data-tag'] ?? "null",
                imageUrl: recipeArticle.querySelector("img")?.attributes['src'] ?? recipeArticle.querySelector("img")?.attributes['data-src'] ?? "null",
              )
          );
        }
      }

      HomePageModel homePageModel = HomePageModel(
        mainArticle: HomeArticleModel(
          url: homePageElement.querySelector("a.comp.mntl-document-card--featured.mntl-document-card.mntl-card.card.card--no-image")?.attributes['href'] ?? "null",
          title: homePageElement.querySelector("div.card__content > span.card__title > span.card__title-text")?.text.trim() ?? "null",
          imageUrl: homePageElement.querySelector("div.primary-image__media > div.img-placeholder > img")?.attributes['src'] ?? "null",
          description: homePageElement.querySelector("div.card__content > div.card__description")?.attributes['data-card-description'] ?? "null",
        ),
        randomRecipes: randomRecipes,
        randomArticles: randomArticles,
      );

      print(recipeArticlesSections.length);
      return homePageModel;
    }else{
      throw Exception("Failed to load home page");
    }
  }
}