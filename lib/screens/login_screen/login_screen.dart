import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:skillbox_fb_test/firebase_utls/auth.dart';
import 'package:skillbox_fb_test/screens/login_screen/code_confirm_alert.dart';
import 'package:skillbox_fb_test/screens/login_screen/logo.dart';
import 'package:skillbox_fb_test/screens/login_screen/number_login_button.dart';
import 'package:skillbox_fb_test/screens/login_screen/number_textfield.dart';
import 'package:skillbox_fb_test/screens/login_screen/signin_google_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  var _isNumberCorrect = false;

  var _numberTextfieldMaskFormatter = new MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  var _numberTextfieldController = TextEditingController();

  var _numberAuthCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initTextFields();
  }

  void initTextFields() {
    _numberTextfieldController.addListener(() {
      setState(() {
        _isNumberCorrect = false;
      });

      if (_numberTextfieldMaskFormatter.getUnmaskedText().length == 10) {
        setState(() {
          _isNumberCorrect = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(height: 32),
          NumberTextField(
              numberTextfieldController: _numberTextfieldController,
              numberTextfieldMaskFormatter: _numberTextfieldMaskFormatter),
          SizedBox(height: 16),
          NumberLoginButton(
            isNumberCorrect: _isNumberCorrect,
            numberTextfieldMaskFormatter: _numberTextfieldMaskFormatter,
            onPress: () async {
              await registerUser('+7 9789 626 154');
            },
          ),
          SizedBox(height: 16),
          SignInWithGoogleButton(onPress: () async {
            var user = await signInWithGoogle();
          }),
        ],
      ),
    );
  }

  Future registerUser(String mobile) async {
    await auth.setLanguageCode("ru");
    return auth.verifyPhoneNumber(
      phoneNumber: '+1 222-333-4455',
      timeout: Duration(seconds: 60),
      verificationCompleted: (authCredential) {
        print("Авторизован ${authCredential.toString()}");
      },
      verificationFailed: (authException) {
        print('auth fail ${authException.message}');
      },
      codeSent: (String verificationId, [int forceResendingToken])async {
        print("code sent $verificationId");
        var userCreds = await showDialog<UserCredential>(
          context: context,
          builder: (context) => CodeConfirmDialog(
            verificationId: verificationId,
            numberAuthCodeController: _numberAuthCodeController,
          ),
        );
        print("register user ${userCreds}");
      },
      codeAutoRetrievalTimeout: (string) {
        print("code retrieve $string");
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    auth.signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }
}
