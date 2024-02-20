import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/svg_assets.dart';
import 'package:twitter/theme/pallete.dart';

class CustomAppBar {
  static AppBar build() {
    return AppBar(
      title: SvgPicture.asset(
        SvgAssetsConstants.twitterLogo,
        colorFilter: const ColorFilter.mode(
          Pallete.blueColor,
          BlendMode.srcIn,
        ),
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
