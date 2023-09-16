import 'package:e_commerce/email&pass_auth/firebaseHelper.dart';
import 'package:e_commerce/view/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance
      .currentUser; // not to show login page after login, if login show it has been logout before
  runApp(MaterialApp(home: user == null ? RegistrationFire() : HomeApi()));
}

class RegistrationFire extends StatefulWidget {
  const RegistrationFire({super.key});

  @override
  State<RegistrationFire> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<RegistrationFire> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 55, 92),
          title: Text('Sign up'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          iconColor: Colors.black,
                          border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
                          
                            hintText: 'Email',
                            helperText: 'Enter email eg:jon@gmail.com',
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          iconColor: Colors.black,
                           border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
                          
                            hintText: 'Password',
                            helperText: 'contains atleast 6 letters or words',
                            prefixIcon: Icon(Icons.lock_open)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),

            ElevatedButton(
                onPressed: () {
                  String mail = emailController.text.trim();
                  String pwd = passwordController.text.trim();

                  FireHelper()
                      .signUp(email: mail, password: pwd)
                      .then((result) {
                    if (result == null) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => login()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                },
                child: Text('Sign up'),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 9, 55, 92))),
                ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account",style: TextStyle(fontSize: 15)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>login()));
                      },
                      child: Text('login',style: TextStyle(color: Color.fromARGB(255, 4, 57, 101),fontWeight: FontWeight.bold,fontSize: 15),)),
                ],
              ),
            )
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(primary: Colors.white,
            //   minimumSize: Size(double.infinity, 50)),
            //   onPressed: (){
            //     //  FireHelper().signInWithGoogle();

            //   }, icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,), label: Text('Sign Up with Google'),)
          ]),
        ));
  }
}
