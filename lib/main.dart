import 'package:currency_converter/pages/currency_converter_material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StateLess -> State Immutable
// StateFul -> State Mutable

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // to pass an identifier to the extended class (StatelessWidget) from the inherited class (child)

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // design system made by Google, whereas Cupertino design made by Apple
      home: CurrencyConverterMaterialPage(),
    );
  }
}