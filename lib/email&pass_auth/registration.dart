// import 'package:e_commerce/email&pass_auth/firebaseHelper.dart';
// import 'package:e_commerce/view/HomePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// import 'home.dart';
// import 'login.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   User? user = FirebaseAuth.instance
//       .currentUser; // not to show login page after login, if login show it has been logout before
//   runApp(MaterialApp(home: user == null ? RegistrationFire() : HomeApi()));
// }

// class RegistrationFire extends StatefulWidget {
//   const RegistrationFire({super.key});

//   @override
//   State<RegistrationFire> createState() => _RegistrationFireState();
// }

// class _RegistrationFireState extends State<RegistrationFire> {
//   final email = TextEditingController();
//   final password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 12, 63, 105),
//         title: Text('Registration'),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: email,
                
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   border: OutlineInputBorder()),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: password,
                
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   border: OutlineInputBorder()),
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   String mail = email.text.trim();
//                   String pwd = password.text.trim();
      
//                   FireHelper().signUp(email: mail, password: pwd).then((result) {
//                     if (result == null) {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) => login()));
//                     } else {
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(SnackBar(content: Text(result)));
//                     }
//                   });
//                 },
//                 child: Text('Registration')),
//                 SizedBox(

//                   height: 5,
//                 ),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(primary: Colors.white,
//                   minimumSize: Size(double.infinity, 50)),
//                   onPressed: (){
//                     //  FireHelper().signInWithGoogle();

                
//                   }, icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,), label: Text('Sign Up with Google'),)
//           ],
//         ),
//       ),
//     );
//   }
 
// }
