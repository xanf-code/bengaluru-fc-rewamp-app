import 'package:bengaluru_fc/Model/ArticleModel.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class Posts {
  List<PostModel> news = [];
  Future<void> getPosts() async {
    String url = "http://www.bengalurufc.com/wp-json/wp/v2/posts";

    var response = await http.get(url);
    var jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData.forEach(
        (element) {
          PostModel postModel = PostModel(
            type: element["type"],
            url: element["jetpack_featured_media_url"],
            link: element["link"],
            title: element["title"]["rendered"],
            content: element["content"]["rendered"],
            excerpt: element["excerpt"]["rendered"],
            date: element["date"],
          );
          news.add(postModel);
        },
      );
    }
  }
}
