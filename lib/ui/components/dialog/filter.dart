import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/ui/components/button.dart';
import 'package:luwe/ui/components/custom_textfield.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({super.key});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  List<String> bahan = [
    "Ayam",
    "Bawang",
    "Cabe",
    "Daun Jeruk",
    "Bawang Merah",
    "Bawang Putih",
  ];
  List<String> active = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter Pencarian',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Text(
                'Mau cari berdasarkan bahan yang ada dirumah?',
                style: TextStyle(fontSize: 14, color: ColorAsset.textGrey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: ColorAsset.lightGrey.withValues(alpha: 0.5),
                  thickness: 1.5,
                  height: 32,
                ),
              ),
              Text(
                'Pilihan Bahan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          for (var i in bahan)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (active.where((e) => i == e).isNotEmpty) {
                                    active.removeWhere((e) => i == e);
                                  } else {
                                    active.add(i);
                                  }
                                });
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: ColorAsset.primary),
                                  color:
                                      active.where((e) => i == e).isEmpty
                                          ? ColorAsset.white
                                          : ColorAsset.primary,
                                ),
                                child: Text(
                                  i,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        active.where((e) => i == e).isEmpty
                                            ? ColorAsset.primary
                                            : ColorAsset.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: ColorAsset.primary),
                              ),
                              child: Text(
                                'Lainnya...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorAsset.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Waktu Memasak',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextField(
                      fillColor: ColorAsset.grey,
                      radius: 30,
                      horizontalPadding: 20,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text('Menit')],
                        ),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  rWidth(10),
                  Text(
                    'Sampai',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  rWidth(10),
                  Expanded(
                    child: CustomTextField(
                      fillColor: ColorAsset.grey,
                      radius: 30,
                      horizontalPadding: 20,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text('Menit')],
                        ),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorAsset.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
