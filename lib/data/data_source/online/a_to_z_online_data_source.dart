import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:recipa/data/models/a_to_z_model.dart';
import 'package:http/http.dart' as http;

import '../../models/a_to_z_item_page_model.dart';

class AToZOnlineDataSource{
  final String url = "https://www.allrecipes.com/recipes-a-z-6735880";
  AToZModel? _aToZModel;

  Future<AToZModel> fetchAToZHtml() async{
    if(_aToZModel != null){
      print("Returning cached A-Z data");
      return _aToZModel!;
    }
    final http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      Document document = parse(response.body);
      _aToZModel = AToZModel.fromHtml(document);
      return _aToZModel!;
    }else{
      throw Exception("Error fetching data: ${response.statusCode}");
    }
  }
}

class AToZPageOnlineDataSource{
  Future<AToZItemPageModel> fetchAToZItemPageHtml(String url) async{
    final http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      Document document = parse(response.body);
      return AToZItemPageModel.fromHtml(document);
    }else{
      throw Exception("Error fetching data: ${response.statusCode}");
    }
  }
}
