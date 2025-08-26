import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double blur;
  final int backgroundAlpha; // from 0 to 255
  final Color backgroundColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding,
    this.blur = 10.0,
    this.backgroundAlpha = 25, // ~10% opacity
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor.withAlpha(backgroundAlpha),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: backgroundColor.withAlpha(40),
              width: 0.8,
            ),
          ),
          padding: padding ?? const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}
