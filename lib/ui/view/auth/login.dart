import 'package:flutter/material.dart';
import 'package:luwe/core/provider/auth_provider.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';
import 'package:luwe/ui/components/custom_textfield.dart';
import 'package:luwe/ui/view/auth/register.dart';
import 'package:luwe/ui/view/dashboard.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obs = true;

  bool emailValidation(String value) {
    if (RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  final formkey = GlobalKey<FormState>();

  bool passValidate = true;
  bool emailValidate = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  image: AssetImage('assets/img/onboard-2.png'),
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
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      height: emailValidate ? 55 : 73,
                      radius: 50,
                      expands: true,
                      controller: emailController,
                      fillColor: Color(0xFFEEEEEE),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            emailValidate = false;
                          });
                          return 'Email tidak boleh kosong';
                        } else if (!emailValidation(value)) {
                          setState(() {
                            emailValidate = false;
                          });
                          return 'Format email tidak valid';
                        }
                        setState(() {
                          emailValidate = true;
                        });
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      height: passValidate ? 55 : 73,
                      radius: 50,
                      obscureText: obs,
                      controller: passwordController,
                      maxLines: 1,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              obs = !obs;
                            });
                          },
                          child: Icon(
                            obs ? Icons.visibility : Icons.visibility_off,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            Map<String, dynamic> request = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };
                            Provider.of<AuthProvider>(
                              context,
                              listen: false,
                            ).login(request);
                          }
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
                            'Login',
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
                            'Tidak memilii akun? ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigation().goReplace(const Register(), context);
                            },
                            child: Text(
                              'Buat Akun Baru',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4DA1A9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '|',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigation().goRemove(const Dashboard(), context);
                            },
                            child: Text(
                              'Masuk sebagai Guest',
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
