import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:signinfirebase/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _authf = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        //   backgroundColor: const Color(0xff191820),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(35)),
                const Text("Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
                const SizedBox(height: 30),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    onChanged: (String value) {
                      email = value;
                    },
                    validator: (value) {
                      return value!.isEmpty ? 'enter Email' : null;
                    }),
                //
                const SizedBox(height: 40),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: (String value) {
                    password = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter password' : null;
                  },
                ),
                //
                SizedBox(
                  width: 350,
                  height: 65,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user =
                                await _authf.createUserWithEmailAndPassword(
                                    email: email.toString().trim(),
                                    password: password.toString().trim());
                            if (user != null) {
                              print('Sucess');
                              toastMessag('Login Sucessfull');
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          } catch (e) {
                            print((e.toString()));
                            toastMessag(e.toString());
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void toastMessag(String message) {
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
