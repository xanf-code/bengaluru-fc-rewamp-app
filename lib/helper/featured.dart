import 'package:bengaluru_fc/Model/ArticleModel.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class Featured {
  List<FeaturedModel> featured = [];
  Future<void> getFeaturedPosts() async {
    String url =
        "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=178";

    var response = await http.get(url);
    var jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData.forEach(
        (element) {
          FeaturedModel featuredModel = FeaturedModel(
            type: element["type"],
            url: element["jetpack_featured_media_url"],
            link: element["link"],
            title: element["title"]["rendered"],
            content: element["content"]["rendered"],
            excerpt: element["excerpt"]["rendered"],
            date: element["date"],
          );
          featured.add(featuredModel);
        },
      );
    }
  }
}
