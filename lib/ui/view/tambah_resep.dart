import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luwe/core/model/alat_mode.dart';
import 'package:luwe/core/model/bahan_model.dart';
import 'package:luwe/core/provider/recipe_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';
import 'package:luwe/ui/components/button.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/home.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class Tambah extends StatefulWidget {
  const Tambah({super.key});

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  File? tumbnail;
  Future pickImage() async {
    try {
      final tumbnail = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (tumbnail == null) return;
      final imageTemp = File(tumbnail.path);
      setState(() => this.tumbnail = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future takeTumbnail() async {
    try {
      final tumbnail = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      if (tumbnail == null) return;
      final imageTemp = File(tumbnail.path);
      setState(() => this.tumbnail = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to take tumbnail: $e');
    }
  }

  List<Map<String, dynamic>> fotoTambahan = [];

  Future pickAdditionalImage(int index) async {
    try {
      final additionalImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (additionalImage == null) return;
      final imageTemp = File(additionalImage.path);
      setState(() {
        fotoTambahan.where((foto) => foto['index'] == index).isEmpty
            ? fotoTambahan.add({'index': index, 'file': imageTemp})
            : fotoTambahan
                    .where((foto) => foto['index'] == index)
                    .first['file'] =
                imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick additional image: $e');
    }
  }

  Future takeAdditionalImage(int index) async {
    try {
      final additionalImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      if (additionalImage == null) return;
      final imageTemp = File(additionalImage.path);

      setState(() {
        fotoTambahan.where((foto) => foto['index'] == index).isEmpty
            ? fotoTambahan.add({'index': index, 'file': imageTemp})
            : fotoTambahan
                    .where((foto) => foto['index'] == index)
                    .first['file'] =
                imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to take additional image: $e');
    }
  }

  TextEditingController tittleController = TextEditingController();
  TextEditingController waktuMasakController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  String selectedCategory = '';

  List<Map<String, dynamic>> alat = [];
  List<TextEditingController> langkah = [];
  List<Map<String, dynamic>> bahan = [];
  List<String> categories = ['appetizer', 'main_course', 'dessert'];

  @override
  void initState() {
    super.initState();
    setState(() {
      alat.add({
        'selected': AlatModel(id: 0, name: 'Pilih Alat', jumlah: 0),
        'controllerJumlah': TextEditingController(),
      });
      bahan.add({
        'selected': BahanModel(
          id: 0,
          name: 'Pilih Bahan',
          jumlah: 0,
          units: [],
        ),
        'controllerJumlah': TextEditingController(),
        'unit': 'Pilih Satuan',
      });
      langkah.add(TextEditingController());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipeProvider>(context, listen: false).getAlat();
      Provider.of<RecipeProvider>(context, listen: false).getBahan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      appBar: AppBar(
        backgroundColor: ColorAsset.white,
        title: Text('Posting Resep Anda'),
        scrolledUnderElevation: 0.0,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, prov, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                color: ColorAsset.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.all(20),
                              height: 150,
                              child: Column(
                                children: [
                                  Text(
                                    'Pilih Tumbnail',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                          takeTumbnail();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            'Ambil Foto',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                          pickImage();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            'Pilih dari Galeri',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 1,
                          ),
                          image:
                              tumbnail != null
                                  ? DecorationImage(
                                    image: FileImage(tumbnail!),
                                    fit: BoxFit.cover,
                                    opacity: 0.6,
                                  )
                                  : null,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 40,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Foto Tumbnail',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: ColorAsset.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pilih Foto Tambahan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              takeAdditionalImage(1);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Ambil Foto',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickAdditionalImage(1);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Pilih dari Galeri',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                              image:
                                  fotoTambahan
                                          .where((foto) => foto['index'] == 1)
                                          .isNotEmpty
                                      ? DecorationImage(
                                        image: FileImage(
                                          fotoTambahan.firstWhere(
                                            (foto) => foto['index'] == 1,
                                          )['file'],
                                        ),
                                        fit: BoxFit.cover,
                                        opacity: 0.6,
                                      )
                                      : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Foto Tambahan',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: ColorAsset.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pilih Foto Tambahan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              takeAdditionalImage(2);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Ambil Foto',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickAdditionalImage(2);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Pilih dari Galeri',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                              image:
                                  fotoTambahan
                                          .where((foto) => foto['index'] == 2)
                                          .isNotEmpty
                                      ? DecorationImage(
                                        image: FileImage(
                                          fotoTambahan.firstWhere(
                                            (foto) => foto['index'] == 2,
                                          )['file'],
                                        ),
                                        fit: BoxFit.cover,
                                        opacity: 0.6,
                                      )
                                      : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Foto Tambahan',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: ColorAsset.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pilih Foto Tambahan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              takeAdditionalImage(3);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Ambil Foto',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickAdditionalImage(3);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Pilih dari Galeri',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                              image:
                                  fotoTambahan
                                          .where((foto) => foto['index'] == 3)
                                          .isNotEmpty
                                      ? DecorationImage(
                                        image: FileImage(
                                          fotoTambahan.firstWhere(
                                            (foto) => foto['index'] == 3,
                                          )['file'],
                                        ),
                                        fit: BoxFit.cover,
                                        opacity: 0.6,
                                      )
                                      : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Foto Tambahan',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: ColorAsset.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pilih Foto Tambahan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              takeAdditionalImage(4);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Ambil Foto',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickAdditionalImage(4);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                              child: Text(
                                                'Pilih dari Galeri',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1,
                              ),
                              image:
                                  fotoTambahan
                                          .where((foto) => foto['index'] == 4)
                                          .isNotEmpty
                                      ? DecorationImage(
                                        image: FileImage(
                                          fotoTambahan.firstWhere(
                                            (foto) => foto['index'] == 4,
                                          )['file'],
                                        ),
                                        fit: BoxFit.cover,
                                        opacity: 0.6,
                                      )
                                      : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Foto Tambahan',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: tittleController,
                      hintStyle: TextStyle(fontSize: 12),
                      horizontalPadding: 10,
                      hintText: 'Nama Resep Makanan',
                      fillColor: ColorAsset.grey,
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: waktuMasakController,
                      hintStyle: TextStyle(fontSize: 12),
                      horizontalPadding: 10,
                      hintText: 'Waktu Masak',
                      fillColor: ColorAsset.grey,
                      style: TextStyle(fontSize: 12),
                      keyboardType: TextInputType.number,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'Menit',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      height: null,
                      controller: deskripsiController,
                      hintStyle: TextStyle(fontSize: 12),
                      horizontalPadding: 10,
                      hintText: 'Deskripsi Resep Makanan',
                      fillColor: ColorAsset.grey,
                      style: TextStyle(fontSize: 12),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    DropdownSearch<String>(
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                      selectedItem:
                          selectedCategory.isEmpty
                              ? 'Pilih Kategori'
                              : selectedCategory,
                      items: (filter, loadProps) => categories,
                      compareFn: (i, s) => i == s,
                      dropdownBuilder:
                          (ctx, selectedItem) => Text(
                            selectedItem == 'appetizer'
                                ? 'Makanan Pembuka'
                                : selectedItem == 'main_course'
                                ? 'Makanan Utama'
                                : selectedItem == 'dessert'
                                ? 'Makanan Penutup'
                                : 'Pilih Kategori',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorAsset.grey,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      popupProps: PopupProps.bottomSheet(
                        bottomSheetProps: BottomSheetProps(
                          backgroundColor: ColorAsset.white,
                        ),
                        itemBuilder:
                            (context, item, isDisabled, isSelected) =>
                                isSelected || selectedCategory == item
                                    ? Container(
                                      color: ColorAsset.grey,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        item == 'appetizer'
                                            ? 'Makanan Pembuka'
                                            : item == 'main_course'
                                            ? 'Makanan Utama'
                                            : 'Makanan Penutup',
                                      ),
                                    )
                                    : Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        item == 'appetizer'
                                            ? 'Makanan Pembuka'
                                            : item == 'main_course'
                                            ? 'Makanan Utama'
                                            : 'Makanan Penutup',
                                      ),
                                    ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Alat', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: alat.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: DropdownSearch<AlatModel>(
                                      onChanged: (value) {
                                        setState(() {
                                          alat[index]['selected'] = value!;
                                        });
                                      },
                                      selectedItem: alat[index]['selected'],
                                      items: (filter, loadProps) => prov.alat,
                                      compareFn: (i, s) => i.id == s.id,
                                      dropdownBuilder:
                                          (ctx, selectedItem) => Text(
                                            selectedItem?.name ?? 'Pilih alat',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                      decoratorProps: DropDownDecoratorProps(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: ColorAsset.grey,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                        ),
                                      ),
                                      popupProps: PopupProps.bottomSheet(
                                        bottomSheetProps: BottomSheetProps(
                                          backgroundColor: ColorAsset.white,
                                        ),
                                        itemBuilder:
                                            (
                                              context,
                                              item,
                                              isDisabled,
                                              isSelected,
                                            ) =>
                                                isSelected ||
                                                        alat[index]['selected']
                                                                .id ==
                                                            item.id
                                                    ? Container(
                                                      color: ColorAsset.grey,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 20,
                                                          ),
                                                      child: Text(item.name!),
                                                    )
                                                    : Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 20,
                                                          ),
                                                      child: Text(item.name!),
                                                    ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CustomTextField(
                                  controller: alat[index]['controllerJumlah'],
                                  hintStyle: TextStyle(fontSize: 12),
                                  horizontalPadding: 10,
                                  hintText: 'Jumlah',
                                  fillColor: ColorAsset.grey,
                                  style: TextStyle(fontSize: 12),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 10),
                              if (alat.length - 1 != index)
                                CustomButton(
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    setState(() {
                                      alat.removeAt(index);
                                    });
                                  },
                                  radius: 10,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.minus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              if (alat.length - 1 == index)
                                CustomButton(
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    setState(() {
                                      alat.add({
                                        'selected': AlatModel(
                                          id: 0,
                                          name: 'Pilih Alat',
                                          jumlah: 0,
                                        ),
                                        'controllerJumlah':
                                            TextEditingController(),
                                      });
                                    });
                                  },
                                  radius: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.plus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    Text('Bahan', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: bahan.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        FocusScope.of(
                                          context,
                                        ).requestFocus(FocusNode());
                                      },
                                      child: SizedBox(
                                        height: 50,
                                        child: DropdownSearch<BahanModel>(
                                          onChanged: (value) {
                                            setState(() {
                                              bahan[index]['selected'] = value!;
                                            });
                                          },
                                          selectedItem:
                                              bahan[index]['selected'],
                                          items:
                                              (filter, loadProps) => prov.bahan,
                                          compareFn: (i, s) => i.id == s.id,
                                          dropdownBuilder:
                                              (ctx, selectedItem) => Text(
                                                selectedItem?.name ??
                                                    'Pilih alat',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 12),
                                              ),

                                          decoratorProps: DropDownDecoratorProps(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: ColorAsset.grey,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide.none,
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                    borderSide: BorderSide.none,
                                                  ),
                                            ),
                                          ),
                                          popupProps: PopupProps.bottomSheet(
                                            bottomSheetProps: BottomSheetProps(
                                              backgroundColor: ColorAsset.white,
                                            ),
                                            itemBuilder:
                                                (
                                                  context,
                                                  item,
                                                  isDisabled,
                                                  isSelected,
                                                ) =>
                                                    isSelected ||
                                                            bahan[index]['selected']
                                                                    .id ==
                                                                item.id
                                                        ? Container(
                                                          color:
                                                              ColorAsset.grey,
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                                horizontal: 20,
                                                              ),
                                                          child: Text(
                                                            item.name!,
                                                          ),
                                                        )
                                                        : Container(
                                                          margin:
                                                              EdgeInsets.symmetric(
                                                                vertical: 10,
                                                                horizontal: 20,
                                                              ),
                                                          child: Text(
                                                            item.name!,
                                                          ),
                                                        ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomTextField(
                                            controller:
                                                bahan[index]['controllerJumlah'],
                                            hintStyle: TextStyle(fontSize: 12),
                                            horizontalPadding: 10,
                                            hintText: 'Jumlah',
                                            fillColor: ColorAsset.grey,
                                            style: TextStyle(fontSize: 12),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: DropdownSearch<String>(
                                              onChanged: (value) {
                                                setState(() {
                                                  bahan[index]['unit'] = value!;
                                                });
                                              },
                                              selectedItem:
                                                  bahan[index]['unit'],
                                              items:
                                                  (filter, loadProps) =>
                                                      bahan[index]['selected']
                                                          .units,
                                              compareFn: (i, s) => i == s,
                                              dropdownBuilder:
                                                  (ctx, selectedItem) => Text(
                                                    selectedItem ??
                                                        'Pilih Bahan',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                              suffixProps:
                                                  DropdownSuffixProps(),
                                              decoratorProps: DropDownDecoratorProps(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: ColorAsset.grey,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              15,
                                                            ),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              15,
                                                            ),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              15,
                                                            ),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                ),
                                              ),
                                              popupProps: PopupProps.bottomSheet(
                                                bottomSheetProps:
                                                    BottomSheetProps(
                                                      backgroundColor:
                                                          ColorAsset.white,
                                                    ),
                                                itemBuilder:
                                                    (
                                                      context,
                                                      item,
                                                      isDisabled,
                                                      isSelected,
                                                    ) =>
                                                        isSelected ||
                                                                bahan[index]['unit'] ==
                                                                    item
                                                            ? Container(
                                                              color:
                                                                  ColorAsset
                                                                      .grey,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        20,
                                                                  ),
                                                              child: Text(item),
                                                            )
                                                            : Container(
                                                              margin:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        20,
                                                                  ),
                                                              child: Text(item),
                                                            ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              if (bahan.length - 1 != index)
                                CustomButton(
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    setState(() {
                                      bahan.removeAt(index);
                                    });
                                  },
                                  radius: 10,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.minus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              if (bahan.length - 1 == index)
                                CustomButton(
                                  onTap: () {
                                    setState(() {
                                      FocusScope.of(
                                        context,
                                      ).requestFocus(FocusNode());
                                      bahan.add({
                                        'selected': BahanModel(
                                          id: 0,
                                          name: 'Pilih Bahan',
                                          jumlah: 0,
                                          units: [],
                                        ),
                                        'controllerJumlah':
                                            TextEditingController(),
                                        'unit': 'Pilih Satuan',
                                      });
                                    });
                                  },
                                  radius: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.plus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    Text(
                      'Langkah Langkah Memasak',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: langkah.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomTextField(
                                  controller: langkah[index],
                                  maxLines: 2,
                                  height: null,
                                  horizontalPadding: 10,
                                  fillColor: ColorAsset.grey,
                                  hintText: 'Langkah Memasak ${index + 1}',
                                  hintStyle: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 10),
                              if (langkah.length - 1 != index)
                                CustomButton(
                                  radius: 10,
                                  color: Colors.red,
                                  onTap: () {
                                    setState(() {
                                      langkah.removeAt(index);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.minus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              if (langkah.length - 1 == index)
                                CustomButton(
                                  radius: 10,
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    setState(() {
                                      langkah.add(TextEditingController());
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(
                                      PhosphorIcons.plus(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (tumbnail == null) {
                            Snackbar.error(
                              'Tumbnail tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (tittleController.text.isEmpty) {
                            Snackbar.error(
                              'Judul resep tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (waktuMasakController.text.isEmpty) {
                            Snackbar.error(
                              'Waktu masak tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (deskripsiController.text.isEmpty) {
                            Snackbar.error(
                              'Deskripsi tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (selectedCategory.isEmpty) {
                            Snackbar.error(
                              'Kategori tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (alat.isEmpty ||
                              alat.any((a) => a['selected'].id == 0)) {
                            Snackbar.error('Alat tidak boleh kosong', context);
                            return;
                          }
                          if (bahan.isEmpty ||
                              bahan.any((b) => b['selected'].id == 0)) {
                            Snackbar.error('Bahan tidak boleh kosong', context);
                            return;
                          }
                          if (langkah.isEmpty ||
                              langkah.any((l) => l.text.isEmpty)) {
                            Snackbar.error(
                              'Langkah memasak tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          List<Map<String, dynamic>> postAlat =
                              alat.map((e) {
                                return {
                                  'id': e['selected'].id,
                                  'amount': e['controllerJumlah'].text,
                                };
                              }).toList();
                          List<Map<String, dynamic>> postBahan =
                              bahan.map((e) {
                                return {
                                  'id': e['selected'].id,
                                  'unit': e['unit'],
                                  'amount': e['controllerJumlah'].text,
                                };
                              }).toList();
                          List foto = [];
                          if (fotoTambahan.isNotEmpty) {
                            foto =
                                fotoTambahan.map((e) {
                                  return MultipartFile.fromFileSync(
                                    e['file'].path,
                                  );
                                }).toList();
                          }

                          List<Map<String, dynamic>> steps =
                              langkah.map((e) {
                                return {'instruction': e.text};
                              }).toList();

                          Map<String, dynamic> request = {
                            'title': tittleController.text,
                            'cooking_time': waktuMasakController.text,
                            'steps': steps,
                            'bahans': postBahan,
                            'alats': postAlat,
                            'category': selectedCategory,
                            'description': deskripsiController.text,
                            'images[]': foto,
                            'thumbnail': await MultipartFile.fromFile(
                              tumbnail!.path,
                            ),
                          };
                          setState(() {
                            Provider.of<RecipeProvider>(
                              context,
                              listen: false,
                            ).postResep(request);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2E5077),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
