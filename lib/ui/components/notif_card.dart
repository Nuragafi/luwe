import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class NotifCard extends StatelessWidget {
  const NotifCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorAsset.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: ColorAsset.lightGrey.withValues(alpha: 0.5),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[200], size: 30),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Risky ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Menambahkan resep anda ke favorit',
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/img/onboard-2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
