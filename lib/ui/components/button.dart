import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double radius;
  final double? width;
  final double height;
  final Color? color;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.radius = 20,
    this.width,
    this.height = 50,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? ColorAsset.primary,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
