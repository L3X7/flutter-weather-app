import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getCities(String city) async {

  try{
    var uri = Uri.parse('http://localhost:8080/api/city/get-city-by-name');
    uri = uri.replace(query: 'name=' + city);
    final response = await http.get(uri);
    return json.decode(response.body);
  }
  catch(exception){
    return null;
  }
//  try {
//    return await http.get('').then((dynamic res) {
//      return json.decode(res.body);
//    }).catchError((e) {
//      throw Exception('Failed');
//    });
//  } catch (exception) {
//
//  }
}
