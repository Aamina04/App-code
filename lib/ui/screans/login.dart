import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:ems/constants.dart';
import 'package:ems/cores/authcore.dart';
import 'package:ems/ui/myhome.dart';
import 'package:ems/ui/widgets/loginbar.dart';
import 'package:ems/ui/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/authentification-screen';
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Login Screen Page

class _LoginPageState extends State<LoginPage> {
  // Login Credentialss
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Auth State Initialization
  final authState = Get.put(AuthState());

  // Form Validation Key for Email and Password
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //Poassword not Visible or Visisble
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 1));
    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1));
    TextStyle style = const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180), child: LoginBar()),
      backgroundColor: scaffoldColor,
      body: Center(
        child: Container(
          width: size.width >= 500 ? 400 : size.width * 0.85,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              // Email Validation String that Contain characters, "at the Rate" and .com
                              String e =
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                              bool isEmail =
                                  RegExp(e).hasMatch(emailController.text);
                              if (!isEmail) {
                                return 'Not Valid Email Address';
                              }
                              print(isEmail);
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              enabledBorder: border,
                              focusedBorder: border,
                              errorBorder: errorBorder,
                              focusedErrorBorder: errorBorder,
                              hintStyle: style,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: isSecure,
                            controller: passwordController,
                            // validator: (value) {
                            //   // Password Leng must be greater than 6 chacractor
                            //   if (value == null || value.length <= 6) {
                            //     return 'Password Very Week';
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                              enabledBorder: border,
                              focusedBorder: border,
                              errorBorder: errorBorder,
                              focusedErrorBorder: errorBorder,
                              hintStyle: style,
                              suffixIcon: GestureDetector(
                                child: isSecure == true
                                    ? const Icon(
                                        BootstrapIcons.lock,
                                        color: bubbleColor,
                                      )
                                    : const Icon(BootstrapIcons.unlock,
                                        color: bubbleColor),
                                onTap: () {
                                  setState(() {
                                    isSecure = !isSecure;
                                  });
                                },
                              ),
                            ),
                          ),

                          /*         Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Switch(
                                      splashRadius: 15,
                                      activeColor: bubbleColor,
                                      value: _switchValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _switchValue = value;
                                        });
                                      },
                                    ),
                                    const Text("Rememeber me"),
                                  ],
                                ),
                                const Text("Forget Password"),
                              ],
                            ),
                   */

                          MyButton(
                              title: "Log In",
                              onPressed: () {
                                print('login pressed');
                                if (formKey.currentState!.validate()) {
                                  authState.handleLogin(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                                  // Get.snackbar(
                                  //   "Login",
                                  //   "Successfully Login ",
                                  //   backgroundColor: Colors.white,
                                  //   snackPosition: SnackPosition.BOTTOM,
                                  //   margin: const EdgeInsets.only(bottom: 10),
                                  //   borderRadius: 6,
                                  // );
                                  final route = MaterialPageRoute(
                                      builder: (context) => const MyHomePage());
                                  print('opening home page');
                                  Navigator.push(context, route);
                                }
                              }),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
