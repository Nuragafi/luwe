import 'package:flutter/material.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/provider/recipe_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:provider/provider.dart';

class FilteredList extends StatelessWidget {
  final List<Recipe> listRecipe;
  const FilteredList({super.key, required this.listRecipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      appBar: AppBar(
        backgroundColor: ColorAsset.white,
        elevation: 3,
        shadowColor: ColorAsset.lightGrey.withValues(alpha: 0.2),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Resep buat kamu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: listRecipe.length,
        itemBuilder: (context, index) {
          final data = listRecipe[index];
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Provider.of<RecipeProvider>(
                context,
                listen: false,
              ).toDetail(data.id!);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: ColorAsset.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: ColorAsset.lightGrey.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        bottom: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title ?? 'Judul Resep',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data.description ?? 'Deskripsi Resep',
                            style: TextStyle(fontSize: 11),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined, size: 16),
                              SizedBox(width: 5),
                              Text(
                                '${data.cookingTime} Menit',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(
                        right: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(data.thumbnailUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
