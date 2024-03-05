import 'package:flutter/material.dart';
import 'package:food_ninja/src/widgets/index.dart';

class CheckBoxGreen extends StatefulWidget {
  final bool value;
  final Function(bool) onPress;

  const CheckBoxGreen({super.key, required this.value, required this.onPress});

  @override
  State<CheckBoxGreen> createState() => _CheckBoxGreenState();
}

class _CheckBoxGreenState extends State<CheckBoxGreen> {
  late bool _value = widget.value;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        onPress: () {
          setState(() {
            _value = !_value;
            widget.onPress(_value);
          });
        },
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: _value ? Colors.green : null,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white70, width: 1)),
            child: _value
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null));
  }
}
