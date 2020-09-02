import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NumberLoginButton extends StatelessWidget {
  const NumberLoginButton({
    Key key,
    @required bool isNumberCorrect,
    @required MaskTextInputFormatter numberTextfieldMaskFormatter,
    @required this.onPress,
  })  : _isNumberCorrect = isNumberCorrect,
        _numberTextfieldMaskFormatter = numberTextfieldMaskFormatter;

  final bool _isNumberCorrect;
  final MaskTextInputFormatter _numberTextfieldMaskFormatter;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 42,
      child: RaisedButton(
        color: Colors.blue,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onPressed: _isNumberCorrect
            ? () async {
                print('+7${_numberTextfieldMaskFormatter.getUnmaskedText()}');
                onPress();
              }
            : null,
        child: Text(
          "вход по номеру",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}