import 'package:flutter/material.dart';
import 'app.dart';
import 'config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(
    appTitle: 'Flutter Flavor',
    apiBaseUrl: 'https://api.example.com/v1',
    flavor: Flavor.prod,
    primaryColor: Colors.deepPurple,
    showDebugBanner: false,
  );

  runApp(const MyApp());
}
