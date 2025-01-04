import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class DrawerWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Widget? trailingWidget;
  final bool isSelected;

  const DrawerWidget({
    super.key,
    required this.imagePath,
    required this.text,
    this.trailingWidget,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isSvg = imagePath.endsWith('.svg');
    bool isPngOrJpg = imagePath.endsWith('.png') || imagePath.endsWith('.jpg');

    return Container(
      width: 238,
      height: 56,
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected == false ? Colors.transparent : FrontendConfigs.kAppPrimaryColor.withOpacity(0.10),
      ),
      child: Row(
        children: [
          if (isSvg)
            SvgPicture.asset(
              imagePath,
              height: 22,
              width: 22,
              color: isSelected ?  text == 'Calendar' ? null : FrontendConfigs.kAppPrimaryColor : text == 'Calendar' ? FrontendConfigs.kAppPrimaryColor : null,
            )
          else if (isPngOrJpg)
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
              color: isSelected ?FrontendConfigs.kAppPrimaryColor : null,
            )
          else
            Container(),
          SizedBox(width:8,),
          Text( text,style:TextStyle(color: isSelected ? FrontendConfigs.kAppPrimaryColor : null,fontSize:15,fontWeight:FontWeight.w600)),
          const Spacer(),
          if (trailingWidget != null) trailingWidget!,
        ],
      ),
    );
  }
}
