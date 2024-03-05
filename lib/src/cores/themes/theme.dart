import 'package:flutter/material.dart';
import './styles/index.dart';

final Map<String, Map> appStyles = {"text": textStyles};

ThemeData themeApp(BuildContext context) { 
  return ThemeData(
    textTheme: Theme.of(context).textTheme.apply(
      fontFamily: "BentonSans-Regular"
    )
  );
}
