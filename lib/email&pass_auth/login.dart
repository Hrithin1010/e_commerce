import 'package:e_commerce/email&pass_auth/firebaseHelper.dart';
import 'package:e_commerce/email&pass_auth/home.dart';
import 'package:e_commerce/email&pass_auth/registration.dart';
import 'package:e_commerce/view/HomePage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final _auth=FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 55, 92),
          title: Text('Login'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal()),
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
                              border: OutlineInputBorder(
                                
                                  borderRadius: BorderRadius.horizontal()),
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
                      .signIn(email: mail, password: pwd)
                      .then((result) {
                    if (result == null) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeApi()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                },
                child: Text('Login'),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 9, 55, 92))),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegistrationFire()));
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New user?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 9, 55, 92),
                        ),
                      ),
                      Text(
                        '  Signin',
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 55, 92),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
