import 'package:flutter/material.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/provider/explore_provider.dart';
import 'package:luwe/core/provider/recipe_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/dialog/filter.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/detail_resep.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExploreProvider>(context, listen: false).index();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<ExploreProvider>(context, listen: false).index();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: SafeArea(
        child: Consumer<ExploreProvider>(
          builder: (context, prov, _) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/img/logo.png', height: 30),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          height: 55,
                          radius: 50,
                          expands: true,
                          fillColor: Color(0xFFEEEEEE),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              PhosphorIcons.magnifyingGlass(),
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Cari Resep ....',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: ColorAsset.lightGrey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: ColorAsset.white,
                            context: context,
                            builder: (context) {
                              return FilterSearch();
                            },
                          );
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorAsset.secondaryDark,
                          ),
                          child: Center(
                            child: Icon(
                              PhosphorIcons.slidersHorizontal(),
                              color: ColorAsset.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        Provider.of<ExploreProvider>(
                          context,
                          listen: false,
                        ).refresh();
                      });
                    },
                    child: ListView.builder(
                      itemCount:
                          prov.hasMore
                              ? prov.recipes.length + 1
                              : prov.recipes.length,
                      itemBuilder: (context, index) {
                        if (index < prov.recipes.length) {
                          final data = prov.recipes[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.displayName ?? 'Resep Populer',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Lihat Semua',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorAsset.secondaryDark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        data
                                            .recipes
                                            ?.length, // Replace with your data length
                                    itemBuilder: (context, index) {
                                      final recipe = data.recipes?[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Provider.of<RecipeProvider>(
                                              context,
                                              listen: false,
                                            ).toDetail(recipe.id!);
                                          },
                                          child: ResepCard(recipe: recipe!),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
