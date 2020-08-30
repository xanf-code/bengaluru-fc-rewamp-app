import 'package:bengaluru_fc/Model/leaguetable.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class Standing {
  List<TableModel> table = [];
  Future<void> getStandings() async {
    String url =
        "https://www.thesportsdb.com/api/v1/json/1/lookuptable.php?l=4791&s=2019-2020";

    var response = await http.get(url);
    var jsonData = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData["table"].forEach(
        (element) {
          TableModel tableModel = TableModel(
            name: element["name"],
            played: element["played"],
            goalsfor: element["goalsfor"],
            goalsagainst: element["goalsagainst"],
            goalsdifference: element["goalsdifference"],
            win: element["win"],
            draw: element["draw"],
            loss: element["loss"],
            total: element["total"],
          );
          table.add(tableModel);
        },
      );
    }
  }
}
