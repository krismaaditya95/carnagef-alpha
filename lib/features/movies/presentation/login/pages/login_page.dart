import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/assets.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/getx/login_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/bordered_button.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {

  static const String routeName = '/login-page';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(movieOverlay),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppThemes.black252525,
                BlendMode.multiply
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    movieIcon,
                    width: 80,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Krisma Aditya's\nthemoviedb Flutter App", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("Silahkan Login menggunakan akun\nthemoviedb anda", style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Username
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: controller.usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                          ),
                          labelText: "username",
                          labelStyle: TextStyle(color: Colors.white)
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your username';
                          }
                          return null;
                        },
                      ),
                    ),

                    // Password
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                            labelText: "password",
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                    ),

                    Obx((){
                      if(controller.isLoginLoading.value == true){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 40),
                              child: const CircularProgressIndicator(
                                color: AppThemes.c6EACDA,
                              ),
                            ),
                            const Text('Logging you in, please wait...', style: TextStyle(
                                fontSize: 16,
                              color: AppThemes.c6EACDA,
                            ))
                          ],
                        );
                      }else{
                        return GeneralButton(
                          // fixedSize: const Size(double.infinity, 80),
                            minimumSize: const Size(double.infinity, 60),
                            // maximumSize: const Size(double.infinity, 40),
                            text: "LOGIN",
                            callback: (){
                              if(controller.formKey.currentState!.validate()){
                                // if form is valid
                                controller.loginUsernamePassword();
                              }
                            }
                        );
                      }
                    }),

                  ],
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                  "2024 \u00a9 Albertus Krisma Aditya Giovanni",
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            )
          ],
        )
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
