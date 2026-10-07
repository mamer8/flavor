import 'package:flutter/material.dart';
import 'config/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.shared;

    return MaterialApp(
      title: config.appTitle,
      debugShowCheckedModeBanner: config.showDebugBanner,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: config.primaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const FlavorHomePage(),
    );
  }
}

class FlavorHomePage extends StatefulWidget {
  const FlavorHomePage({super.key});

  @override
  State<FlavorHomePage> createState() => _FlavorHomePageState();
}

class _FlavorHomePageState extends State<FlavorHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.shared;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(config.appTitle),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flavor Info Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            config.isProduction
                                ? Icons.verified_rounded
                                : config.isStaging
                                    ? Icons.bug_report_rounded
                                    : Icons.developer_mode_rounded,
                            color: config.primaryColor,
                            size: 32,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Active Flavor: ${config.flavor.name.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: config.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      _buildInfoRow('App Title', config.appTitle),
                      const SizedBox(height: 8),
                      _buildInfoRow('API Endpoint', config.apiBaseUrl),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        'Environment',
                        config.isProduction
                            ? 'Production (Live)'
                            : config.isStaging
                                ? 'QA / Staging'
                                : 'Local Development',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: config.primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
