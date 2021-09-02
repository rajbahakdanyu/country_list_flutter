import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/database/country_db.dart';
import 'package:sqflite_test/provider/country_provider.dart';

import '../components/country_card.dart';
import '../model/Country.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Country> _countryList;

  @override
  void dispose() {
    CountryDB.instance.close();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget countryList(List<Country> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return CountryCard(
          name: countries[index].name,
          capital: countries[index].capital,
          flag: countries[index].flag,
          language: countries[index].languages,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _countryList =
        Provider.of<CountryProvider>(context, listen: true).countryData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
      ),
      body: Container(
        child: _countryList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : countryList(_countryList),
      ),
      // body: FutureBuilder<List<Country>>(
      //   future: CountryApi.getCountries(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('An error has occurred!'),
      //       );
      //     } else if (snapshot.hasData) {
      //       return countryList(snapshot.data!);
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
