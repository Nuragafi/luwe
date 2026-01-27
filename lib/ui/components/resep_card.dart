import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ResepCard extends StatelessWidget {
  final double? width;
  final Recipe recipe;
  final VoidCallback? onTap;
  const ResepCard({super.key, required this.recipe, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (MediaQuery.of(context).size.width - 70) / 2,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(recipe.thumbnailUrl!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0x332E5077), Color(0xFF2E5077)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorAsset.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        recipe.isFavorited ?? false
                            ? PhosphorIcons.bookmarkSimple(
                              PhosphorIconsStyle.fill,
                            )
                            : PhosphorIcons.bookmarkSimple(),
                        color: ColorAsset.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  color: ColorAsset.lightGrey,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  '${recipe.cookingTime} Menit',
                  style: TextStyle(fontSize: 14, color: ColorAsset.lightGrey),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              recipe.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: ColorAsset.white),
            ),
          ],
        ),
      ),
    );
  }
}
