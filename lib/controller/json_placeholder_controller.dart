import 'package:api_fetch/constant/file_apirequest.dart';
import 'package:api_fetch/model/users_model.dart';
import 'package:http/http.dart' as http;

class jsonplaceholderController {
  Future<List<Users>> getUserController() async {
    var url = Confij().getUers;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return usersFromJson(response.body);
    } else {
      print("Request not found");
    }
    return usersFromJson(response.body);
  }
}
