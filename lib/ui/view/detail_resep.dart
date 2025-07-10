import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/view/home.dart';

class DetailResep extends StatefulWidget {
  const DetailResep({super.key});

  @override
  State<DetailResep> createState() => _DetailResepState();
}

class _DetailResepState extends State<DetailResep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigation().goPush(const Home(), context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Detal Resep',
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
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/onboard-2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/onboard-2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/onboard-2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/onboard-2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/onboard-2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Nasi Goreng',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),
              Row(
                children: const [
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '20 Menit',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              const Text(
                'Alat & Bahan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisi est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue et aliquet. Nunc sagittis dictum nisl, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue.',
                style: TextStyle(fontSize: 12, height: 1.5),
              ),

              const SizedBox(height: 10),
              Text(
                'Langkah Pembuatan',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisi est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue et aliquet. Nunc sagittis dictum nisl, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue.',
                style: TextStyle(fontSize: 12, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
