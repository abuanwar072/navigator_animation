import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:navigator_animation/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      isToolbarVisible: false,
      enabled: true,
      devices: [Devices.ios.iPhone13],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheFlutterWay',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
