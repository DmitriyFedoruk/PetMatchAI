import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final double borderRadius;
  final Color highlightColor;
  final Widget child;
  const CustomInkWell({
    this.borderRadius = 90,
    required this.highlightColor,
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        highlightColor: highlightColor,
        hoverColor: highlightColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
