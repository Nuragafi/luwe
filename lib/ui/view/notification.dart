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
        elevation: 0,
        scrolledUnderElevation: 0.0,
      ),
      // body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return NotifCard();
            },
          ),
        ),
      ),
    );
  }
}
