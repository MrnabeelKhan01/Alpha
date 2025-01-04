import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'layout/body.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.profileImage, required this.name,});
final String profileImage;
final String name;

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back_icon.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.profileImage),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: FrontendConfigs.kAppTitleStyle,
                ),
                Text(
                  "6 Members, 3 Online",
                  style: TextStyle(
                      fontSize: 15, color: FrontendConfigs.kAppGreyColor),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:14.0),
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EAED),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:  EdgeInsets.all(4.0),
                child: SvgPicture.asset("assets/icons/more_icon.svg",color:FrontendConfigs.kAppTextColor,),
              ),
            ),
          )
        ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(6),
            child: Divider(height: 1,color:Color(0xffE3E5E8),),
          )
      ),
      body: const ChatViewBody(),
    );
  }
}
