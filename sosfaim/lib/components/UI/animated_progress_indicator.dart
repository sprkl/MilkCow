import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatefulWidget {
  final double from;
  final double to;
  final MaterialColor backgroundColor;
  final AlwaysStoppedAnimation<Color> valueColor;
  _ProgressIndicatorDemoState state;

  AnimatedProgressIndicator(
      {Key key, this.from, this.to, this.backgroundColor, this.valueColor})
      : super(key: key);

  @override
  _ProgressIndicatorDemoState createState() {
    state =
        new _ProgressIndicatorDemoState(from, to, backgroundColor, valueColor);
    return state;
  }
}

class _ProgressIndicatorDemoState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Tween<double> tween;

  final double from;
  final double to;
  final Color backgroundColor;
  final Animation<Color> valueColor;

  _ProgressIndicatorDemoState(
      this.from, this.to, this.backgroundColor, this.valueColor);

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if ((oldWidget as AnimatedProgressIndicator).from != this.widget.from) {
      updateAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  void initAnimation() {
    tween = Tween(begin: from, end: to);

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  void updateAnimation() {
    tween.begin = widget.from;
    tween.end = widget.to;
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new LinearProgressIndicator(
        value: animation.value,
        valueColor: valueColor,
        backgroundColor: backgroundColor);
  }
}
