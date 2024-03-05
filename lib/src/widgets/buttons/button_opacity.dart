// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {

  const TouchableOpacity({
    super.key, 
    required this.child, 
    required this.onPress,
    this.activeOpacity = 0.7
  });

  final Widget child;
  final double activeOpacity;
  final void Function() onPress;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double _co = 1.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => setState(() => _co = widget.activeOpacity),
      onPointerUp: (event) => setState(() => _co = 1.0),
      child: GestureDetector(
        onTap: widget.onPress,
        child: AnimatedOpacity(
          opacity: _co,
          duration: const Duration(milliseconds: 200),
          child: widget.child
        ),
      ),
    );
  }
}
