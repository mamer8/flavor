import 'package:flutter/material.dart';
import 'app.dart';
import 'config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(
    appTitle: 'Flutter Flavor (Dev)',
    apiBaseUrl: 'https://dev-api.example.com/v1',
    flavor: Flavor.dev,
    primaryColor: Colors.teal,
    showDebugBanner: true,
  );

  runApp(const MyApp());
}
