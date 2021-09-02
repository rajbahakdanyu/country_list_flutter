import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite_test/components/language_tile.dart';
import 'package:sqflite_test/model/Language.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.name,
    required this.capital,
    required this.flag,
    required this.language,
  }) : super(key: key);

  final String name;
  final String capital;
  final String flag;
  final List<Languages> language;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 5.w,
        ),
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: flag,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        capital,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      height: 25.0,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return LanguageTile(name: language[index].name);
                        },
                        itemCount: language.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
