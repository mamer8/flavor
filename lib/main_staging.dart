import 'package:flutter/material.dart';
import 'app.dart';
import 'config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(
    appTitle: 'Flutter Flavor (Staging)',
    apiBaseUrl: 'https://staging-api.example.com/v1',
    flavor: Flavor.staging,
    primaryColor: Colors.amber.shade800,
    showDebugBanner: true,
  );

  runApp(const MyApp());
}
