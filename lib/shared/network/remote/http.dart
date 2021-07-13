import 'package:http/http.dart' as http;

class HttpHelper {
  Future getData({required String url}) async {
    var modifiedUrl = Uri.parse(url);
    var response = await http.get(modifiedUrl);
    return response.body;
  }
}
