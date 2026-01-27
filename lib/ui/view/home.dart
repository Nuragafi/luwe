import 'package:flutter/material.dart';
import 'package:luwe/core/provider/recipe_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/resep_card.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/detail_resep.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        Provider.of<RecipeProvider>(context, listen: false).index();
      });
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
      setState(() {
        Provider.of<RecipeProvider>(context, listen: false).index();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<RecipeProvider>(context, listen: false).refresh();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/img/logo.png', height: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cari resep yg bikin kamu mood sekarang',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorAsset.lightGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Consumer<RecipeProvider>(
                  builder: (context, prov, _) {
                    return Column(
                      children: [
                        Wrap(
                          spacing: 25,
                          runSpacing: 25,
                          children:
                              prov.recipes.map((recipe) {
                                return InkWell(
                                  onTap: () {
                                    prov.toDetail(recipe.id!);
                                  },
                                  child: Hero(
                                    tag: 'tumbnail${recipe.id}',
                                    child: ResepCard(
                                      recipe: recipe,
                                      onTap: () async {
                                        if (!recipe.isFavorited!) {
                                          prov.addBookmark(recipe.id!);
                                        } else {
                                          prov.removeBookmark(recipe.id!);
                                        }
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        if (prov.isLoading)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorAsset.primary,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
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
