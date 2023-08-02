import 'package:flutter/material.dart';

import 'example_page/combined_page.dart';
import 'example_page/horizontal_updating_page.dart';
import 'home_page.dart';
import 'example_page/horizontal_page.dart';
import 'example_page/vertical_updating_page.dart';
import 'example_page/vertical_page.dart';

const List<Color> colors = [
  ...Colors.primaries,
  Colors.white,
  Colors.black,
];

const HOME_ROUTE = '/';
const VERTICAL_ROUTE = '/vertical';
const HORIZONTAL_ROUTE = '/horizontal';
const COMBINED_ROUTE = '/combined';
const VERTICAL_UPDATING_ROUTE = '/vertical_updating';
const HORIZONTAL_UPDATING_ROUTE = '/horizontal_updating';

void main() {
  runApp(
    MaterialApp(
      title: 'Drag&Drop Lib Example',
      initialRoute: HOME_ROUTE,
      routes: {
        HOME_ROUTE: (context) => const HomePage(),
        VERTICAL_ROUTE: (context) => const VerticalPage(),
        HORIZONTAL_ROUTE: (context) => const HorizontalPage(),
        COMBINED_ROUTE: (context) => const CombinedPage(),
        VERTICAL_UPDATING_ROUTE: (context) => const VerticalUpdatingPage(),
        HORIZONTAL_UPDATING_ROUTE: (context) => const HorizontalUpdatingPage(),
      },
    ),
  );
}
