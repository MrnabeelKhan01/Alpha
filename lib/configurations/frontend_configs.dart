import 'package:flutter/material.dart';

class FrontendConfigs {
  static Color kAppPrimaryColor = Color(0xff2D99FF);
  static Color kAppSecondaryColor = Color(0xffFF6640);
  static Color kAppTextColor = Color(0xff1A1926);
  static Color kAppGreenColor =Color(0xff55D46A);
  static Color kAppBorderColor = Color(0xffE3E5E8);
  static Color kAppGreyColor = Color(0xff637085);
  static Color kAppWhiteColor = Color(0xffFFFFFF);
  static String kAppLogo="assets/images/app_logo.png";
  static TextStyle kAppHeadingStyle = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xff1A1926));
  static TextStyle kAppSubHeadingStyle = TextStyle(
      fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xff1A1926));
  static TextStyle kAppTitleStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xff2D3F59));
  static BoxShadow kAppBoxShadow = BoxShadow(
      blurRadius: 30,
      offset: Offset(0, 20),
      spreadRadius: -18,
      color: Color(0xff040F15).withOpacity(0.10));
}
