import 'package:flutter/material.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/search_bar.dart';
import 'package:luwe/ui/view/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obsPass = true;
  bool obsVerif = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/onboard-1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.50, 0.00),
                    end: Alignment(0.50, 1.00),
                    colors: [Colors.white.withValues(alpha: 0), Colors.white],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      height: 55,
                      radius: 50,
                      expands: true,
                      fillColor: Color(0xFFEEEEEE),
                      hintText: 'Nama Lengkap',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      height: 55,
                      radius: 50,
                      expands: true,
                      fillColor: Color(0xFFEEEEEE),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      height: 55,
                      radius: 50,
                      obscureText: obsPass,
                      maxLines: 1,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              obsPass = !obsPass;
                            });
                          },
                          child: Icon(
                            obsPass ? Icons.visibility : Icons.visibility_off,
                            color: ColorAsset.primary,
                          ),
                        ),
                      ),
                      fillColor: const Color(0xFFEEEEEE),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      height: 55,
                      radius: 50,
                      obscureText: obsVerif,
                      maxLines: 1,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              obsVerif = !obsVerif;
                            });
                          },
                          child: Icon(
                            obsVerif ? Icons.visibility : Icons.visibility_off,
                            color: ColorAsset.primary,
                          ),
                        ),
                      ),
                      fillColor: const Color(0xFFEEEEEE),
                      hintText: 'Verifikasi Password',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          // Handle login action
                        },
                        child: Container(
                          height: 50,

                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: ColorAsset.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sudah Punya akun? ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigation().goRemove(const Login(), context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4DA1A9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
