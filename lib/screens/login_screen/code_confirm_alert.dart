import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillbox_fb_test/firebase_utls/auth.dart';

class CodeConfirmDialog extends StatelessWidget {
  const CodeConfirmDialog({
    Key key,
    @required TextEditingController numberAuthCodeController,
    @required this.verificationId,
  })  : _numberAuthCodeController = numberAuthCodeController,
        super(key: key);

  final TextEditingController _numberAuthCodeController;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter SMS Code"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _numberAuthCodeController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Done"),
          textColor: Colors.white,
          color: Colors.redAccent,
          onPressed: () async {
            var smsCode = _numberAuthCodeController.text.trim();

            var _credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);

            var userCreds = await auth.signInWithCredential(_credential);

            Navigator.of(context).pop(userCreds);
          },
        )
      ],
    );
  }
}
