import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/app.dart';

Future main() async {
  
  await dotenv.load(fileName: ".env");

  runApp(const App());
}
