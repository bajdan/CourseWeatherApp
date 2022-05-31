import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class IApiManager{
 Future<Map<String, dynamic>> makeRequest(Uri uri);
}

class ApiManager extends IApiManager{
  @override
  Future<Map<String, dynamic>> makeRequest(Uri uri) async {
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if(response.statusCode==200){
      return json.decode(response.body);
    }else{
      throw Exception('Error response');
    }
  }
}


