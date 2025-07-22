import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      appBar: AppBar(
        backgroundColor: ColorAsset.white,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          _buildProfilSection(),
          _buildNavigationTabs(),
          Expanded(child: _buildRecipeGrid()),
        ],
      ),
    );
  }

  Widget _buildProfilSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: ColorAsset.white,
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, size: 75, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'User',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorAsset.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: Text('Edit Profil'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationTabs() {
    return Container(
      color: ColorAsset.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: ColorAsset.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem(Icons.room_service, 'Resep'),
                _buildTabItem(Icons.bookmark, ' Favorit'),
                _buildTabItem(Icons.favorite, 'like'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.grey[500], size: 20),
              SizedBox(width: 5),
              Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeGrid() {
    final List<Map<String, String>> recipes = List.generate(
      9,
      (index) => {
        'title': 'Nasi Goreng Ati Ampela',
        'date': '20 Menit',
        'image':
            'https://dcostseafood.id/wp-content/uploads/2021/12/Nasi-Goreng-Tom-Yum.jpg',
      },
    );

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return _buildRecipeCard(
          recipes[index]['title']!,
          recipes[index]['date']!,
          recipes[index]['image']!,
        );
      },
    );
  }

  Widget _buildRecipeCard(String title, String date, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Nasi Goreng Ati Ampela',
              style: TextStyle(fontSize: 12, color: ColorAsset.white),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  color: ColorAsset.white,
                  size: 10,
                ),
                SizedBox(width: 5),
                Text(
                  '20 Menit',
                  style: TextStyle(fontSize: 8, color: ColorAsset.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
