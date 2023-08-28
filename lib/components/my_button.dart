import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  final Color backgroundColor;
  final TextStyle style; // Added style parameter for customizing text style

  const MyButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.backgroundColor = Colors.white,
    required this.style, // Use the provided style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: style, // Use the provided style
          ),
        ),
      ),
    );
  }
}
