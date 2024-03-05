import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/src/widgets/buttons/button_opacity.dart';
import 'package:iconly/iconly.dart';

class Input extends StatefulWidget {
  final EdgeInsets margin;
  final String placeholder;
  final String? errorText;
  final TextEditingController? controller;
  final TextStyle textStyle;
  final int? maxCharacter;
  final bool enabled;
  final bool obscure;
  final Widget? prefixIcon;
  final Function(String)? onChanged;

  const Input(
      {super.key,
      this.margin = const EdgeInsets.only(bottom: 4),
      this.placeholder = "Placeholder",
      this.errorText,
      this.controller,
      this.textStyle = const TextStyle(color: Colors.white),
      this.maxCharacter,
      this.enabled = true,
      this.obscure = false,
      this.prefixIcon,
      this.onChanged
    });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool obscureText = widget.obscure;

  Widget buildIconObscure() {
    return TouchableOpacity(
        child: Icon(
          IconlyBold.show,
          color: (obscureText) ? Colors.white12 : Colors.green.shade500,
        ),
        onPress: () {
          setState(() {
            obscureText = !obscureText;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        cursorColor: Colors.white60,
        enabled: widget.enabled,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: Colors.white30),
            fillColor: Colors.white10,
            // disabledBorder: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  style: BorderStyle.none,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
            filled: true,
            counterStyle: const TextStyle(fontSize: 0, height: 0),
            errorText: widget.errorText,
            suffixIcon: widget.obscure ? buildIconObscure() : null),
        style: widget.textStyle,
        obscureText: obscureText,
        maxLength: widget.maxCharacter,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
      ),
    );
  }
}
