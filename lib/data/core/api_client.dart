import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:quiz_app/data/commons/config.dart';

class ApiClient {
  Future getData({required String endpoint}) async {
    final result = await get(Uri.parse(Config.baseUrl + endpoint));
    if (result.statusCode == 200) {
      return json.decode(result.body);
    } else {
      throw Exception('Api Error');
    }
  }
}
