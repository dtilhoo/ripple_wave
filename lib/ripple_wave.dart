library ripple_wave;

import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;

class RippleWave extends StatefulWidget {
  const RippleWave({
    Key? key,
    this.color = Colors.teal,
    this.duration = const Duration(milliseconds: 1500),
    this.repeat = true,
    required this.child,
    this.childTween,
    this.animationController,
    this.waveCount = 5,
  }) : super(key: key);

  ///Color of the ripple
  final Color color;

  ///Widget inside the ripple
  final Widget child;

  /// Tween effect of the child widget
  final Tween<double>? childTween;

  ///Duration of the animation
  final Duration duration;

  ///Repeat the animation. True by default
  final bool repeat;

  ///optional animation controller to manually start or stop the animation
  final AnimationController? animationController;

  ///wave count
  final int waveCount;

  @override
  RippleWaveState createState() => RippleWaveState();
}

class RippleWaveState extends State<RippleWave> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController ??
        AnimationController(
          duration: widget.duration,
          vsync: this,
        );
    if (widget.repeat) {
      _controller.repeat();
    } else if (widget.animationController == null) {
      _controller.forward();
      Future.delayed(widget.duration).then(
        (value) => stopAnimation(),
      );
    }
  }

  Future stopAnimation() async {
    try {
      if (mounted) {
        _controller.reset();
      }

      if (mounted && !_controller.isAnimating) {
        _controller.stop();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RipplePainter(
        _controller,
        widget.waveCount,
        color: widget.color,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  widget.color,
                  Colors.transparent,
                ],
              ),
            ),
            child: ScaleTransition(
              scale: widget.childTween != null
                  ? widget.childTween!.animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: _CurveWave(),
                      ),
                    )
                  : Tween(begin: 0.9, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: _CurveWave(),
                      ),
                    ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class _CurveWave extends Curve {
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return t;
    }
    return math.sin(t * math.pi);
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter(
    this.animation,
    this.waveCount, {
    required this.color,
  }) : super(repaint: animation);
  final Color color;
  final Animation<double> animation;
  final int waveCount;

  void circle(Canvas canvas, Rect rect, double value) {
    final double maxRadius = rect.width / 2;
    final double normalizedValue =
        value / (waveCount + 1); // Normalize value based on wave count
    final double radius =
        maxRadius * normalizedValue; // Scale radius based on normalized value
    final double opacity = (1.0 - normalizedValue)
        .clamp(0.0, 1.0); // Compute opacity based on normalized value
    final Color newColor = color.withValues(alpha: opacity);

    final Paint paint = Paint()..color = newColor;
    canvas.drawCircle(
      rect.center,
      radius,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(
      0.0,
      0.0,
      size.width,
      size.height,
    );
    for (int wave = 0; wave <= waveCount; wave++) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(_RipplePainter oldDelegate) => true;
}
