import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ripple Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ripple Demo"),
      ),
      body: const RippleWave(
        color: Colors.red,
        child: Icon(
          Icons.emoji_objects_outlined,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
