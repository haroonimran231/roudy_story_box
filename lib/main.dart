import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roudy_story_box/run_app/run_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
