import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'provider/country_provider.dart';
import 'screens/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: CountryProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CountryProvider>(context, listen: false).getLocalData();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'SqfLite Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
          },
        );
      },
    );
  }
}
