import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class NotifCard extends StatelessWidget {
  const NotifCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 10, right: 10)),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: ColorAsset.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[300]!, width: 1.0),
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.8),
                  image: DecorationImage(
                    image: AssetImage('assets/img/onboard-2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: ColorAsset.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[300]!, width: 1.0),
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.8),
                  image: DecorationImage(
                    image: AssetImage('assets/img/onboard-2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
