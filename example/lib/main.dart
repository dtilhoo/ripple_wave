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
      body: RippleWave(
        childTween: Tween(begin: 0.2, end: 1),
        duration: const Duration(seconds: 1),
        child: const Icon(
          Icons.emoji_emotions,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
