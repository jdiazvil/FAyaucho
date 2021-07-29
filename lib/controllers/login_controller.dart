import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.snackbar('Hola', 'Su ingreso ha sido exitoso');
      print('Ingreso bien');
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.toNamed("/foodpage");
        },
      );
    } catch (e) {
      Get.snackbar('Fallo', 'No puede ingresar, revise',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if (user == null) {
      Get.snackbar('Out', 'No one has signed in',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String? uid = user.uid;
    Get.snackbar('Out', uid! + 'has successfully signed out.',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed("/home");
  }

  void signInWithGoogle() async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser!.authentication;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(googleAuthCredential);

      final user = userCredential.user;
      Get.snackbar('Hola', 'Sign In ${user!.uid} with Google');
      print('Ingreso bien');

      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.toNamed("/foodpage");
        },
      );
    } catch (e) {
      print(e);

      Get.snackbar('Fallo', 'Faild to sign in with Google: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class FacebookScreen extends StatefulWidget{
  @override
  _FacebookScreenState createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {

  bool _isFBLoggedIn = false;
  Map _userObjFace = {};

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

    @override
    Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
      return Container(
        child: _isFBLoggedIn
            ? Column(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(_userObjFace["picture"]["data"]["url"]),
              backgroundColor: Colors.transparent,
            ),
            Text(
              _userObjFace["name"],
            ),
            TextButton(
                onPressed: () {
                  FacebookAuth.instance.logOut().then((value) {
                    setState(() {
                      _isFBLoggedIn = false;
                      _userObjFace = {};
                    });
                  });
                },
                child: Text("Logout"))
          ],
        )
          :Center(
          child: SignInButton(
            Buttons.FacebookNew,
            text: "Login with Facebook",
            onPressed: () async{
              FacebookAuth.instance.login(
                  permissions: ['public_profile','email']
              ).then((value){
                FacebookAuth.instance.getUserData().then((userData){
                  setState((){
                    _isFBLoggedIn = true;
                    _userObjFace = userData;
                  });
                });
              });
            },
          ),
        ),
      );

    }
}
