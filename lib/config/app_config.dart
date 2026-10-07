import 'package:flutter/material.dart';

enum Flavor {
  dev,
  staging,
  prod,
}

class AppConfig {
  final String appTitle;
  final String apiBaseUrl;
  final Flavor flavor;
  final Color primaryColor;
  final bool showDebugBanner;

  static late AppConfig shared;

  AppConfig({
    required this.appTitle,
    required this.apiBaseUrl,
    required this.flavor,
    required this.primaryColor,
    this.showDebugBanner = true,
  });

  static void initialize({
    required String appTitle,
    required String apiBaseUrl,
    required Flavor flavor,
    required Color primaryColor,
    bool showDebugBanner = true,
  }) {
    shared = AppConfig(
      appTitle: appTitle,
      apiBaseUrl: apiBaseUrl,
      flavor: flavor,
      primaryColor: primaryColor,
      showDebugBanner: showDebugBanner,
    );
  }

  bool get isProduction => flavor == Flavor.prod;
  bool get isStaging => flavor == Flavor.staging;
  bool get isDevelopment => flavor == Flavor.dev;
}
