import 'package:flutter/material.dart';

class BlinkingWidget extends AnimatedWidget {
  const BlinkingWidget({
    super.key,
    required AnimationController controller,
    this.child,
  }) : super(listenable: controller);
  final Widget? child;

  Animation<double> get _opacity => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      alwaysIncludeSemantics: true,
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).
      opacity: _opacity.value > 0.5 ? 1 : 0.1,
      duration: const Duration(milliseconds: 600),
      // The green box must be a child of the AnimatedOpacity widget.
      child: child ??
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
    );
  }
}
