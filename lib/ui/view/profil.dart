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
            radius: 80,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, size: 75, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'User',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent[100],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(Icons.room_service, 'Resep'),
              _buildTabItem(Icons.bookmark, ' Favorit'),
              _buildTabItem(Icons.favorite, 'like'),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey[300], thickness: 1, height: 0),
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
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.7,
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
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Stack(
        children: [
          Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withAlpha(6)],
                  stops: [0.6, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.white70),
                    SizedBox(width: 4),
                    Text(
                      date,
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
