import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTxtTitle extends StatelessWidget {
  final String txtTile;
  const CustomTxtTitle({super.key, required this.txtTile});

  @override
  Widget build(BuildContext context) {
    return Text(
      txtTile,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30),
    );
  }
}
