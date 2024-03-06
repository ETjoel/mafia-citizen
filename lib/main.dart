import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mafia_citizen/firebase_options.dart';
import 'package:mafia_citizen/view/home_view.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(home: HomeView()));
}
