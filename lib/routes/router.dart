
import 'package:flutter/material.dart';
import 'package:pok_api/models/pokemon_model.dart';
import 'package:pok_api/screens/home/home_page.dart';
import 'package:pok_api/screens/pages/first_page.dart';
import 'package:pok_api/screens/pages/search_page.dart';

class MyRouter {
  Route? onGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/search':
        return MaterialPageRoute(
            builder: (context) => SearchPage(data: args as List<Pokemon>));
      case '/first':
        return MaterialPageRoute(builder: (_) => const FirstPage());
    }
  }
}
