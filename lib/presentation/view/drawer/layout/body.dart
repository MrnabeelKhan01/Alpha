
import 'package:alpha/configurations/frontend_configs.dart';
import 'package:alpha/presentation/elements/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../elements/drawer_widget.dart';
import '../../calender/calender_view.dart';

import '../../chat_list/chat_list_view.dart';
import '../../dashboard/dashboard_view.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  double value = 0;
  int selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            width: 270.0,
            decoration:BoxDecoration(
              border:Border(right:BorderSide(color:FrontendConfigs.kAppBorderColor))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:
                  Image.asset(FrontendConfigs.kAppLogo, width: 120, height: 38),
                ),
                SizedBox(height:18,),
                Expanded(
                  child: ListView.builder(
                    padding:EdgeInsets.zero,
                    itemCount: Utils.drawerList.length,
                    itemBuilder: (context, i) {
                      Widget? trailingWidget;
                      if (i == 1) {

                        trailingWidget =  Icon(Icons.arrow_forward_ios_rounded,color:Color(0xff637085),size:18,);
                      } else if (i == 3) {
                        trailingWidget = Container(

                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6.5),
                          decoration:  BoxDecoration(
                            color:FrontendConfigs.kAppSecondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                             '8',
                            style:TextStyle(fontSize:11,fontWeight:FontWeight.w700,color:FrontendConfigs.kAppWhiteColor)
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedScreenIndex =
                                i;
                            value = 0;
                          });
                        },
                        child: DrawerWidget(
                          imagePath:Utils.drawerList[i].icon.toString(),

                          text: Utils.drawerList[i].label.toString(),
                          isSelected: selectedScreenIndex == i,
                          trailingWidget: trailingWidget,
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: value),
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          builder: (_, double val, __) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 270 * val),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = 0;
                  });
                },
                child: AbsorbPointer(
                  absorbing: value == 1,
                  child: Scaffold(
                    appBar: customAppBar(context,
                      onPressed: () {
                        setState(() {
                          value = value == 0 ? 1 : 0;
                        });
                      },
                    ),
                    body: IndexedStack(
                      index: selectedScreenIndex,
                      children:   const [
                        DashboardView(),
                         Center(child: Text("Ecommerce")),
                        CalenderView(),
                        Center(child: Text("Mails")),
                        ChatListView(),
                        Center(child: Text("Tasks")),

                        Center(child: Text("Projects")),
                        Center(child: Text("File Manager")),
                        Center(child: Text("Notes")),
                        Center(child: Text("Contact")),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // _rightClick(),
      ],
    );
  }


}
