import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.grey[400]!, width: 1.0),
      ),
      elevation: 0.0,
      color: ColorAsset.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54, size: 28),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/onboard-3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.50, -0.00),
                    end: Alignment(0.50, 1.00),
                    colors: [
                      Colors.white.withAlpha(0),
                      Colors.white.withAlpha(0),
                      Colors.white.withAlpha(200),
                      Colors.white.withAlpha(255),
                    ],
                    stops: const [0.0, 0.5, 0.9, 1.0],
                  ),
                ),
              ),

              Positioned(
                top: 170,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 120),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                _buildProfileOption(
                  icon: Icons.info_outline,
                  title: 'Edit Profile',
                  onTap: () {
                    print('edit ditekan');
                  },
                ),
                const SizedBox(height: 30),
                _buildProfileOption(
                  icon: Icons.bookmark_border,
                  title: 'Tempat Favorit',
                  onTap: () {
                    print('Tempat Favorit Ditekan');
                  },
                ),
                const SizedBox(height: 30),
                _buildProfileOption(
                  icon: Icons.help_outlined,
                  title: 'Help',
                  onTap: () {
                    print('Help Ditekan');
                  },
                ),
                const SizedBox(height: 30),
                _buildProfileOption(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    print('Logout Ditekan');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
