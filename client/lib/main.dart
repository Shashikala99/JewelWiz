import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jewelwiz/screen/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:jewelwiz/screen/signup_screen.dart';
import 'package:jewelwiz/screen/login_screen.dart';
import 'package:jewelwiz/screen/gemcalculator.dart';
import 'package:jewelwiz/screen/GemstoneCameraScreen.dart';
import 'package:http/http.dart' as http;

void main() {
  var devicePre = true;

  if (devicePre) {
    runApp(DevicePreview(
      //enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));
    // ignore: dead_code
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JewelWiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Start with the HomeScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
