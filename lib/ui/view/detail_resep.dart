import 'package:flutter/material.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/view/home.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DetailResep extends StatefulWidget {
  final Recipe recipe;
  const DetailResep({super.key, required this.recipe});

  @override
  State<DetailResep> createState() => _DetailResepState();
}

class _DetailResepState extends State<DetailResep> {
  int imgActive = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorAsset.white,
        elevation: 3,
        shadowColor: ColorAsset.lightGrey.withValues(alpha: 0.2),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Detail Resep',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: ColorAsset.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Hero(
                      tag: 'tumbnail${widget.recipe.id}',
                      child: Container(
                        height: 270,
                        decoration: BoxDecoration(
                          color: ColorAsset.grey,
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              imgActive == 5
                                  ? widget.recipe.thumbnailUrl!
                                  : widget
                                      .recipe
                                      .images![imgActive]['image_url'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.recipe.images!.isNotEmpty)
                    const SizedBox(width: 5),
                  if (widget.recipe.images!.isNotEmpty)
                    Expanded(
                      child: Column(
                        children: [
                          if (widget.recipe.images!.isNotEmpty)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (imgActive == 5 || imgActive != 0) {
                                    imgActive = 0;
                                  } else {
                                    imgActive = 5;
                                  }
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: ColorAsset.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imgActive == 5 || imgActive != 0
                                          ? widget
                                              .recipe
                                              .images![0]['image_url']
                                          : widget.recipe.thumbnailUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (widget.recipe.images!.length > 1)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (imgActive == 5 || imgActive != 1) {
                                    imgActive = 1;
                                  } else {
                                    imgActive = 5;
                                  }
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: ColorAsset.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imgActive == 5 || imgActive != 1
                                          ? widget
                                              .recipe
                                              .images![1]['image_url']
                                          : widget.recipe.thumbnailUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (widget.recipe.images!.length > 2)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (imgActive == 5 || imgActive != 2) {
                                    imgActive = 2;
                                  } else {
                                    imgActive = 5;
                                  }
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: ColorAsset.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imgActive == 5 || imgActive != 2
                                          ? widget
                                              .recipe
                                              .images![2]['image_url']
                                          : widget.recipe.thumbnailUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (widget.recipe.images!.length > 2)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (imgActive == 5 || imgActive != 3) {
                                    imgActive = 3;
                                  } else {
                                    imgActive = 5;
                                  }
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: ColorAsset.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imgActive == 5 || imgActive != 3
                                          ? widget
                                              .recipe
                                              .images![3]['image_url']
                                          : widget.recipe.thumbnailUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.recipe.title!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(PhosphorIcons.clock(), color: Colors.grey, size: 20),
                  SizedBox(width: 5),
                  Text(
                    '${widget.recipe.cookingTime} Menit',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Deskripsi Resep',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              Text(
                widget.recipe.description!,
                style: TextStyle(fontSize: 12, height: 1.5),
              ),
              const SizedBox(height: 10),
              Text(
                'Alat',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var alat in widget.recipe.alats!)
                Text(
                  '${alat.pivot?['amount']} - ${alat.name}',
                  style: TextStyle(fontSize: 12, height: 1.5),
                ),
              const SizedBox(height: 10),
              Text(
                'Bahan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var bahan in widget.recipe.bahans!)
                Text(
                  '${bahan.pivot?['amount']} ${bahan.pivot?['unit']} - ${bahan.name}',
                  style: TextStyle(fontSize: 12, height: 1.5),
                ),
              const SizedBox(height: 10),
              Text(
                'Cara Memasak',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var steps in widget.recipe.steps!)
                Text(
                  '${steps['step_number']} - ${steps['instruction']}',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
