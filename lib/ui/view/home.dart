import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/detail_resep.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/img/logo.png', height: 32),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  height: 55,
                  radius: 50,
                  expands: true,
                  fillColor: Color(0xFFEEEEEE),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Apa yang ingin anda masak hari ini?',
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
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
                        child: Text(
                          'Kategori ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
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
      ),
    );
  }
}
