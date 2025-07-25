import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/ui/components/notif_card.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: ColorAsset.white,
        elevation: 3,
        shadowColor: ColorAsset.lightGrey.withValues(alpha: 0.2),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return NotifCard();
          },
        ),
      ),
    );
  }
}
