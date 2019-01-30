import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/city.dart';

Future<List<City>> getCities() async {
  try {
//    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final uri = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(uri);
    final listCities = json.decode(response.body);
    List<City> cities = [];
    if (response.body != null) {
      cities = listCities.map((model) => City.fromJson(listCities)).toList();
    }
    return cities;
  }
  catch (exception) {
    return null;
  }
}

Future<List<City>> getCityById(int id) async {
  var uri = Uri.parse('http://localhost:8080/api/city/get-city-by-id');
  uri = uri.replace(query: 'id=' + id.toString());
  try {
    List<City> cities = [];
    final response = await http.get(uri);
    final listCities = json.decode(response.body);
    if(response.body != null){
      cities = listCities.map((model) => City.fromJson(listCities)).toList();
    }
    return cities;
  }
  catch (exception) {
    return null;
  }

}

Future<List<City>> getCityByName(String name) async {
  var uri = Uri.parse('http://localhost:8080/api/city/get-city-by-name');
  uri = uri.replace(query: 'id=' + name);
  try {
    List<City> cities = [];
    final response = await http.get(uri);
    final listCities = json.decode(response.body);
    if(response.body != null){
      cities = listCities.map((model) => City.fromJson(listCities)).toList();
    }
    return cities;
  }
  catch (exception) {
    return null;
  }

}