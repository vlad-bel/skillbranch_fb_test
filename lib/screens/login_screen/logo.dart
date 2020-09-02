import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "firebase_playground",
        style: Theme.of(context)
            .textTheme
            .headline3
            .copyWith(fontWeight: FontWeight.w200),
      ),
    );
  }
}
