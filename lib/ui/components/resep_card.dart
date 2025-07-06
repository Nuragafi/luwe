import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class ResepCard extends StatelessWidget {
  const ResepCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 70) / 2,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(
            'https://dcostseafood.id/wp-content/uploads/2021/12/Nasi-Goreng-Tom-Yum.jpg',
          ),
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
                    child: Icon(Icons.bookmark_border, color: ColorAsset.white),
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
                  '20 Menit',
                  style: TextStyle(fontSize: 14, color: ColorAsset.lightGrey),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Nasi Goreng Ati Ampela',
              style: TextStyle(fontSize: 14, color: ColorAsset.white),
            ),
          ],
        ),
      ),
    );
  }
}
