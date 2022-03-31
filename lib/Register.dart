import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color(0xff191820),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(35)),
            const Text("Register",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            const SizedBox(height: 90),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: const TextField(
                //  controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: const TextField(
                //  controller: emailController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Signin.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: SizedBox(
                width: 350,
                height: 65,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => SignUp(),
                      //     ));
                    },
                    child: const Text(
                      "Register",
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget form(String name2) {
  return TextField(
      decoration: InputDecoration(
    hintText: name2,
    hintStyle: const TextStyle(color: Color.fromARGB(255, 114, 106, 106)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 2, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2),
    ),
  ));
}
