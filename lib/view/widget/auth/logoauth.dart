import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:full_ecommerce/core/constant/imagesasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesAsset.logo,
      height: 250,
      width: 150,
    );
  }
}
