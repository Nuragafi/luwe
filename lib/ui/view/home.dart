import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/detail_resep.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/img/logo.png', height: 32),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  height: 55,
                  radius: 50,
                  expands: true,
                  fillColor: Color(0xFFEEEEEE),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Apa yang ingin anda masak hari ini?',
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          index == 0
                              ? EdgeInsets.only(right: 10, left: 20)
                              : EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: ColorAsset.lightGrey,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(PhosphorIcons.trendUp(), size: 18),
                          SizedBox(width: 5),
                          Text(
                            'Trending',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                children: List.generate(
                  10,
                  (index) => InkWell(
                    onTap: () {
                      Navigation().goPush(const DetailResep(), context);
                    },
                    child: ResepCard(),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
