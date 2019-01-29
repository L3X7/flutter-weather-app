import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/city.dart';

Future<List<City>> getCities(String city) async {

  try{
    var uri = Uri.parse('http://localhost:8080/api/city/get-city-by-name');
    uri = uri.replace(query: 'name=' + city);
    final response = await http.get(uri);
    final listCities = json.decode(response.body);
    List<City> cities = [];
    if(response.body != null){
      cities = listCities.map((model) => City.fromJson(listCities)).toList();
    }
    return cities;
  }
  catch(exception){
    return null;
  }
}
