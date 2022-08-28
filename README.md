Simple and easy to use ripple animation that can be wrapped in widgets to create beautiful ripple effects.

## Features

![ripple_wave](https://user-images.githubusercontent.com/56429814/187088745-9c7c6b9f-b760-4c02-9245-58c0b6a398e3.png| height = 100)


## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

To use this package, add ripple_wave as a dependency in your pubspec.yaml file.

Then wrap your desired widget with RippleWave widget to get the ripple animation.

Usage without repeated animation:

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RippleWave(
        color: Colors.green,
        repeat: false,
        child: const Icon(
          Icons.emoji_emotions,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

```

Usage with tween effect on child widget of the RippleWave:

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RippleWave(
        color: Colors.red,
        childTween: Tween(begin: 0.2, end: 1),
        child: const Icon(
          Icons.emoji_emotions,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
```
