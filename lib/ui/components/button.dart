import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double radius;
  final double? width;
  final double height;
  final Color? color;
  final BoxShape shape;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.radius = 20,
    this.width,
    this.height = 50,
    this.color,
    this.shape = BoxShape.rectangle,
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
          shape: shape,
        ),
        child: child,
      ),
    );
  }
}
