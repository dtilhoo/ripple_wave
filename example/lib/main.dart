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
      home: const DemoPage(),
    );
  }
}

///demo use of the ripple_wave package
class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

late AnimationController animationController;

void start() {
  animationController.repeat();
}

void stop() {
  animationController.stop();
}

class _DemoPageState extends State<DemoPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ripple Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RippleWave(
            childTween: Tween(begin: 0.1, end: 1.0),
            color: Colors.deepPurpleAccent,
            repeat: false,
            animationController: animationController,
            waveCount: 16,
            child: const Icon(
              Icons.emoji_emotions,
              size: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          TextButton(
            onPressed: () {
              start();
            },
            child: const Text(
              'Start animation',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              stop();
            },
            child: const Text(
              'Stop animation',
            ),
          ),
        ],
      ),
    );
  }
}
