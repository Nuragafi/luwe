import 'package:flutter/material.dart';
import 'package:luwe/core/storage/user_storage.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/icon_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/auth/login.dart';
import 'package:luwe/ui/view/explore.dart';
import 'package:luwe/ui/view/home.dart';
import 'package:luwe/ui/view/notification.dart';
import 'package:luwe/ui/view/profil.dart';
import 'package:luwe/ui/view/tambah_resep.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final pages = [const Home(), const Explore(), const Notif(), const Profil()];
  @override
  void initState() {
    // if (storage.token == null) {
    //   pages.removeLast();
    //   pages.removeLast();
    //   pages.add(const Login());
    //   pages.add(const Login());
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 90,
        decoration: BoxDecoration(
          color: ColorAsset.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                currentIndex == 0
                    ? PhosphorIcons.house(PhosphorIconsStyle.fill)
                    : PhosphorIcons.house(),
                color:
                    currentIndex == 0
                        ? ColorAsset.secondary
                        : ColorAsset.primary,
              ),
              onPressed: () => setState(() => currentIndex = 0),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 1
                    ? PhosphorIcons.binoculars(PhosphorIconsStyle.fill)
                    : PhosphorIcons.binoculars(),
                color:
                    currentIndex == 1
                        ? ColorAsset.secondary
                        : ColorAsset.primary,
              ),
              onPressed: () => setState(() => currentIndex = 1),
            ),
            InkWell(
              onTap: () {
                Navigation().goPush(const Tambah(), context);
                // if (storage.token != null) {
                //   Navigation().goPush(const Tambah(), context);
                // } else {
                //   Navigation().goPush(const Login(), context);
                // }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: ColorAsset.primary,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: ImageIcon(IconAsset.add, color: ColorAsset.white),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 2
                    ? PhosphorIcons.bellSimple(PhosphorIconsStyle.fill)
                    : PhosphorIcons.bellSimple(),
                color:
                    currentIndex == 2
                        ? ColorAsset.secondary
                        : ColorAsset.primary,
              ),
              onPressed: () => setState(() => currentIndex = 2),
            ),
            IconButton(
              icon: Icon(
                currentIndex == 3
                    ? PhosphorIcons.user(PhosphorIconsStyle.fill)
                    : PhosphorIcons.user(),
                color:
                    currentIndex == 3
                        ? ColorAsset.secondary
                        : ColorAsset.primary,
              ),
              onPressed: () => setState(() => currentIndex = 3),
            ),
          ],
        ),
      ),
    );
  }
}
