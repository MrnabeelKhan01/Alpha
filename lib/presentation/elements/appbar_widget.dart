import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

customAppBar(BuildContext context, {required VoidCallback onPressed}) {
  return AppBar(
      leading: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset("assets/icons/menu_icon.svg")),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/search_icon.svg")),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/setting_icon.svg")),
        IconButton(
            onPressed: () {},
            icon: Badge(
                smallSize: 7,
              backgroundColor:FrontendConfigs.kAppSecondaryColor,
                child: SvgPicture.asset("assets/icons/notification_icon.svg"))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 1,
            height: MediaQuery.sizeOf(context).height,
            color: Color(0xffE3E5E8),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 14.0, top: 6, bottom: 6, left: 6),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset("assets/images/profile.png"),
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(6),
        child: Divider(
          height: 1,
          color: Color(0xffE3E5E8),
        ),
      ));
}
