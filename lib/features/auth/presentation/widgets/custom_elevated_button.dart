import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final String buttonText;
  final bool isBorderEnabled;
  final IconData? icon;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final bool isLoading;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.height,
    required this.width,
    this.isBorderEnabled = false,
    required this.buttonColor,
    required this.textColor,
    required this.borderRadius,
    required this.icon,
    required this.isLoading,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: widget.isBorderEnabled
          ? BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                Color(0xFF4D7BFA),
                  Color(0xFF3D17E6),
                ],
              ),
              border: Border.all(
                color: const Color(0xFFD9D9D9),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: const Offset(0, 0), // changes position of shadow
                  )
                ])
          : null,
      width: widget.width,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        ),
          onPressed: widget.onPressed,
          child: widget.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonText,
                      style: context.typography.body1Bold.copyWith(color: Colors.white),
                      ),
                      if (widget.icon != null)
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.05),
                            Icon(widget.icon),
                          ],
                        ),
                    ],
                  ),
              ),
      ),
    );
  }
}
