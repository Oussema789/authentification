import 'package:authentification/screens/Data.dart';
import 'package:authentification/screens/profile_page.dart';
import 'package:authentification/screens/signup.dart';
import 'package:authentification/styles/app_colors.dart';
import 'package:authentification/widgets/custom_button.dart';
import 'package:authentification/widgets/custom_formfield.dart';
import 'package:authentification/widgets/custom_header.dart';
import 'package:authentification/widgets/custom_richtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(
            text: 'Log In.',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("images/image2.jpg"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Password",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "At least 8 Character",
                    obsecureText: true,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility), onPressed: () {}),
                    controller: _passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: AppColors.blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    onTap: () async {
                      try {
                        final credential =  FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }

                      }
                      FirebaseAuth auth = FirebaseAuth.instance;
                      FirebaseAuth.instance
                          .idTokenChanges()
                          .listen((User? user) {
                        if (user == null) {
                          print('User is currently signed out!');
                        } else {
                          for (final providerProfile in user.providerData) {
                            final emailAddress = providerProfile.email;
                            local_mail = providerProfile.email!;
                          }
     
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        }
                      });
                    },
                    text: 'Sign In',
                  ),
                  Row(
                    children: [
                      SizedBox(width: 170,),
                      IconButton(
                        color: Colors.green,
                        icon: Icon(Icons.email),
                        onPressed: ()  {
                          try{
                          var credential =  signInWithGoogle();}on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          }

                          };
/////
                          FirebaseAuth auth = FirebaseAuth.instance;
                          FirebaseAuth.instance
                              .idTokenChanges()
                              .listen((User? user) {
                            if (user == null) {
                              print('User is currently signed out!');
                            } else {
                              for (final providerProfile in user.providerData) {
                                final emailAddress = providerProfile.email;
                                local_mail = providerProfile.email!;
                              }

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProfilePage()));
                            }
                          });

                          ////
                        },
                      ),
                    ],
                  ),
                  CustomRichText(
                    discription: "Don't already Have an account? ",
                    text: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
