import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/ui/components/button.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/home.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Tambah extends StatefulWidget {
  const Tambah({super.key});

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  void _handleImageAreaTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fungsionalitas pemilihan foto belum diaktifkan.'),
        duration: Duration(seconds: 2),
      ),
    );
    print('Area foto makanan diketuk. Fungsionalitas image picker belum ada.');
  }

  List<Map<String, dynamic>> alat = [];
  List<TextEditingController> langkah = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      appBar: AppBar(
        backgroundColor: ColorAsset.white,
        title: Text('Posting Resep Anda'),
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _handleImageAreaTap,
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[400]!, width: 1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 40, color: Colors.grey[600]),
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
                    onTap: _handleImageAreaTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[400]!, width: 1),
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
                    onTap: _handleImageAreaTap,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[400]!, width: 1),
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
                    onTap: _handleImageAreaTap,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[400]!, width: 1),
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
                    onTap: _handleImageAreaTap,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[400]!, width: 1),
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Resep Makanan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ColorAsset.grey,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Waktu Masak ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ColorAsset.grey,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
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
                          child: TextFormField(
                            controller: alat[index]['controllerAlat'],
                            decoration: InputDecoration(
                              hintText: "Alat ${index + 1}",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: ColorAsset.grey,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: alat[index]['controllerJumlah'],
                            decoration: InputDecoration(
                              hintText: "Jumlah",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: ColorAsset.grey,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              CustomButton(
                width: 80,
                radius: 10,
                onTap: () {
                  setState(() {
                    alat.add({
                      'controllerAlat': TextEditingController(),
                      'controllerJumlah': TextEditingController(),
                    });
                  });
                },
                child: Icon(
                  PhosphorIcons.plus(PhosphorIconsStyle.fill),
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text('Langkah Langkah Memasak', style: TextStyle(fontSize: 16)),
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
                          child: Text(
                            'Langkah ${index + 1}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: CustomTextField(
                            controller: langkah[index],
                            maxLines: 2,
                            height: null,
                            horizontalPadding: 20,
                            fillColor: ColorAsset.lightGrey,
                            hintText: '....',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              CustomButton(
                width: 80,
                radius: 10,
                onTap: () {
                  setState(() {
                    langkah.add(TextEditingController());
                  });
                },
                child: Icon(
                  PhosphorIcons.plus(PhosphorIconsStyle.fill),
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fungsionalitas submit resep belum lengkap.',
                        ),
                      ),
                    );
                    print(
                      'Tombol Submit ditekan. Fungsionalitas submit belum lengkap.',
                    );
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
  }
}
