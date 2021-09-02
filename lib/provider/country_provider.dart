import 'package:flutter/material.dart';
import 'package:sqflite_test/api/country_api.dart';
import 'package:sqflite_test/database/country_db.dart';
import 'package:sqflite_test/model/Country.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> countryData = [];

  void getLocalData() async {
    countryData = await CountryDB.instance.readAll();

    if (countryData.isEmpty) {
      List<Country> _countryData = await CountryApi.getCountries();

      countryData = _countryData;
      storeData(countryData);
    }

    notifyListeners();
  }

  void storeData(List<Country> countryData) async {
    for (var country in countryData) {
      CountryDB.instance.create(country);
    }
  }
}
