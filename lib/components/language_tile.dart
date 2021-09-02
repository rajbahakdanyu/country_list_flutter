import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  LanguageTile({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      padding: const EdgeInsets.all(3.0),
      child: Text(name),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
