import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.width,
    required this.height,
    this.labelText,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.enabled,
    this.autofocus,
    this.maxLines,
    this.margin,
    this.initialValue,
  });

  final double width;
  final double height;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final String? initialValue;


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: initialValue);

    return Container(
      height: height,
      width: width,
      margin: margin,

      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        // initialValue: widget.initialValue,
        obscureText: obscureText ?? false,
        readOnly: true,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        enabled: enabled ?? true,
        autofocus: autofocus ?? false,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(217, 217, 217, 0.05),
          border: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(183, 183, 183, 0.45),
                Color.fromRGBO(139, 139, 139, 0.45),
                Color.fromRGBO(102, 102, 102, 0.45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
