import 'package:flutter/material.dart';
import 'package:luwe/core/provider/auth_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/auth/login.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obsPass = true;
  bool obsVerif = true;
  bool emailValidation(String value) {
    if (RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();
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
                      fillColor: Color(0xFFEEEEEE),
                      hintText: 'Nama Lengkap',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      controller: nameController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      height: 55,
                      radius: 50,
                      maxLines: 1,
                      fillColor: Color(0xFFEEEEEE),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      controller: emailController,
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
                      controller: passwordController,
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
                      controller: verifyPasswordController,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (!emailValidation(emailController.text)) {
                            Snackbar.error('Format email tidak valid', context);
                            return;
                          }
                          if (nameController.text.isEmpty) {
                            Snackbar.error(
                              'Nama lengkap tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (passwordController.text.isEmpty) {
                            Snackbar.error(
                              'Password tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (verifyPasswordController.text.isEmpty) {
                            Snackbar.error(
                              'Verifikasi password tidak boleh kosong',
                              context,
                            );
                            return;
                          }
                          if (passwordController.text !=
                              verifyPasswordController.text) {
                            Snackbar.error(
                              'Password dan verifikasi password tidak cocok',
                              context,
                            );
                            return;
                          }
                          Map<String, dynamic> req = {
                            'name': nameController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                            'password_confirmation':
                                verifyPasswordController.text,
                          };

                          Provider.of<AuthProvider>(
                            context,
                            listen: false,
                          ).register(req);
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
