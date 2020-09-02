import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField({
    Key key,
    @required TextEditingController numberTextfieldController,
    @required MaskTextInputFormatter numberTextfieldMaskFormatter,
  })  : _numberTextfieldController = numberTextfieldController,
        _numberTextfieldMaskFormatter = numberTextfieldMaskFormatter,
        super(key: key);

  final TextEditingController _numberTextfieldController;
  final MaskTextInputFormatter _numberTextfieldMaskFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextField(
        controller: _numberTextfieldController,
        inputFormatters: [
          _numberTextfieldMaskFormatter,
        ],
        decoration: InputDecoration(
          labelText: 'номер телефона',
          hintText: '+7 (###) ###-##-##',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}