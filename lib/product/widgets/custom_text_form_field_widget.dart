import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool? obscureText,
    String? hintText,
    String? labelText,
    Color? textColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? radius,
    int? maxLines,
    double? height,
    double? width,
    Color? borderColor,
  })  : hintText = hintText,
        labelText = labelText,
        textColor = textColor,
        prefixIcon = prefixIcon,
        borderColor = borderColor,
        suffixIcon = suffixIcon,
        controller = controller,
        validator = validator,
        radius = radius,
        height = height,
        width = width,
        obscureText = obscureText,
        maxLines = maxLines,
        super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double? radius;
  final double? height;
  final double? width;
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: textColor),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(radius ?? 0.0),
          ),
        ),
      ),
    );
  }
}
