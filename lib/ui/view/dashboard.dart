import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/search_bar.dart';
import 'package:luwe/ui/view/home.dart';
import 'package:luwe/ui/view/notification.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final pages = [const Home(), Home(), Home(), Notif(), Home()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: ColorAsset.white,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color:
                    currentIndex == 0
                        ? ColorAsset.primary
                        : ColorAsset.lightGrey,
              ),
              onPressed: () => setState(() => currentIndex = 0),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color:
                    currentIndex == 1
                        ? ColorAsset.primary
                        : ColorAsset.lightGrey,
              ),
              onPressed: () => setState(() => currentIndex = 1),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorAsset.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: ColorAsset.white),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color:
                    currentIndex == 3
                        ? ColorAsset.primary
                        : ColorAsset.lightGrey,
              ),
              onPressed: () => setState(() => currentIndex = 3),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color:
                    currentIndex == 4
                        ? ColorAsset.primary
                        : ColorAsset.lightGrey,
              ),
              onPressed: () => setState(() => currentIndex = 4),
            ),
          ],
        ),
      ),
    );
  }
}
