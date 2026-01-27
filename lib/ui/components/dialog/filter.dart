import 'package:flutter/material.dart';
import 'package:luwe/core/model/bahan_model.dart';
import 'package:luwe/core/provider/explore_provider.dart';
import 'package:luwe/core/provider/recipe_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/dialog_helper.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';
import 'package:luwe/ui/components/button.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/filtered_list.dart';
import 'package:provider/provider.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({super.key});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  List<BahanModel> bahan = [];
  List<BahanModel> bahanOri = [];
  List<int> active = [];

  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  void moveItemsBetweenLists() {
    int numberOfItemsToMove = 10;

    // Pastikan masih ada item yang bisa dipindahkan
    if (bahanOri.isNotEmpty) {
      // Hitung jumlah item yang akan dipindahkan
      int endIndex =
          bahanOri.length >= numberOfItemsToMove
              ? numberOfItemsToMove
              : bahanOri.length;

      // Pindahkan item dari bahanOri ke bahan
      bahan.addAll(bahanOri.sublist(0, endIndex));

      // Hapus item yang sudah dipindahkan dari bahanOri
      bahanOri.removeRange(0, endIndex);

      // Perbarui UI
      setState(() {});
    } else {
      print('Semua item sudah dipindahkan.');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        Provider.of<RecipeProvider>(context, listen: false).getBahan();
        bahan =
            Provider.of<RecipeProvider>(
              context,
              listen: false,
            ).bahan.take(10).toList();
        bahanOri =
            Provider.of<RecipeProvider>(
              context,
              listen: false,
            ).bahan.skip(10).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Consumer2<RecipeProvider, ExploreProvider>(
        builder: (context, recepie, explore, child) {
          return SingleChildScrollView(
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
                                      if (active
                                          .where((e) => i.id == e)
                                          .isNotEmpty) {
                                        active.removeWhere((e) => i.id == e);
                                      } else {
                                        active.add(i.id!);
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
                                      border: Border.all(
                                        color: ColorAsset.primary,
                                      ),
                                      color:
                                          active.where((e) => i.id == e).isEmpty
                                              ? ColorAsset.white
                                              : ColorAsset.primary,
                                    ),
                                    child: Text(
                                      i.name ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            active
                                                    .where((e) => i.id == e)
                                                    .isEmpty
                                                ? ColorAsset.primary
                                                : ColorAsset.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              if (bahanOri.isNotEmpty)
                                InkWell(
                                  onTap: () {
                                    moveItemsBetweenLists();
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: ColorAsset.primary,
                                      ),
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
                          controller: minController,
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
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      rWidth(10),
                      Expanded(
                        child: CustomTextField(
                          controller: maxController,
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
                    onTap: () {
                      if (active.isEmpty) {
                        DialogHelper.initDialog(
                          Dialog(
                            backgroundColor: ColorAsset.white,
                            child: SizedBox(
                              height: 100,
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Pilih minimal 1 bahan untuk pencarian!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          context,
                          true,
                        );
                        return;
                      }
                      if (minController.text.isEmpty ||
                          maxController.text.isEmpty) {
                        DialogHelper.initDialog(
                          Dialog(
                            backgroundColor: ColorAsset.white,
                            child: SizedBox(
                              height: 100,
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Waktu Memasak tidak boleh kosong!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          context,
                          true,
                        );
                        return;
                      }

                      Map<String, dynamic> req = {
                        'available_ingredients[]': active,
                        'min_cooking_time': minController.text, // Replace with actual value
                        'max_cooking_time': maxController.text, // Replace with actual value
                      };
                      explore.getRecommendation(req);
                    },
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
          );
        },
      ),
    );
  }
}
