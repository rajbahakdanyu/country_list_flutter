import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sqflite_test/model/Country.dart';

class CountryApi {
  static Future<List<Country>> getCountries() async {
    List<Country> countryList = [];

    var url = Uri.parse(
      'https://raw.githubusercontent.com/DevTides/countries/master/countriesV2.json',
    );

    var response = await http.get(url);

    var result = jsonDecode(response.body).cast<Map<String, dynamic>>();

    result.forEach((data) {
      var country = Country.fromJson(data);
      countryList.add(country);
    });

    return countryList;
  }
}
