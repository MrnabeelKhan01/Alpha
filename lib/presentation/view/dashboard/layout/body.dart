import 'package:alpha/configurations/frontend_configs.dart';
import 'package:alpha/presentation/view/dashboard/layout/widgets/follower_card.dart';
import 'package:alpha/presentation/view/dashboard/layout/widgets/social_media.dart';
import 'package:alpha/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/activity_card.dart';
import 'widgets/gender_card.dart';
import 'widgets/statistics_card.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  String dropdownValue = "This Week";

  List<String> overViewList = ['This Week', 'This Month', 'This Year'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing:18,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Column(
              children: [
                SizedBox(height:18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Overview",
                      style: FrontendConfigs.kAppHeadingStyle,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: FrontendConfigs.kAppWhiteColor,
                          boxShadow: [FrontendConfigs.kAppBoxShadow]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset("assets/icons/progress_icon.svg"),
                      ),
                    )
                  ],
                ),
                SizedBox(height:18,),
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: FrontendConfigs.kAppBorderColor),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SvgPicture.asset("assets/icons/download_icon.svg"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: FrontendConfigs.kAppBorderColor),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text(
                              "This Week",
                              style: FrontendConfigs.kAppTitleStyle,
                            ),
                            elevation: 1,
                            dropdownColor: FrontendConfigs.kAppWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            value: dropdownValue,
                            style: FrontendConfigs.kAppTitleStyle,
                            items: overViewList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: FrontendConfigs.kAppTitleStyle,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_down_rounded,
                                color: FrontendConfigs.kAppTextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 170,
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return SocialMediaWidget(
                    name: Utils.followerList[i].name,
                    socialMedia: Utils.followerList[i].socialMedia,
                    followers: Utils.followerList[i].followers,
                    logo: Utils.followerList[i].logo,
                  );
                }),
          ),

          FollowerCard(),

          GenderCard(),

          ActivityCard(),

          StatisticsCard(),
          SizedBox(height:8,)

        ],
      ),
    );
  }
}
