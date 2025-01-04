
import 'package:alpha/configurations/frontend_configs.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'event_row.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> times;
  final String time;
  final Color accentColor;
  final int attendeeCount;

  const EventCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.times,
    required this.time,
    required this.accentColor,
    required this.attendeeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 150,
          width: 60,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: times.length,
            itemBuilder: (context, index) {
              // Return each time slot with spacing
              return Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  if (index > 0) const SizedBox(height: 20),
                  Text(
                     times[index],
                    style: FrontendConfigs.kAppTitleStyle,
                  ),

                ],
              );
            },
          ),
        ),

        Flexible(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 8.0,
                dashColor: Color(0xffC6C8CC),
                dashRadius: 0.0,
                dashGapLength: 8.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              Container(
                height:116,
                decoration:BoxDecoration(
                    boxShadow: [
                      FrontendConfigs.kAppBoxShadow,
                    ],
                    borderRadius:BorderRadius.circular(16),
                    color:FrontendConfigs.kAppWhiteColor
                ),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Container(
                          width: 4,
                          height: 84,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style:TextStyle(fontSize:15,fontWeight:FontWeight.w600),

                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                 subtitle,
                                  style:TextStyle(fontSize:12,fontWeight:FontWeight.w400,color:FrontendConfigs.kAppGreyColor),
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset("assets/icons/timer_icon.svg"),
                                const SizedBox(width: 4),
                                Text(
                                   time,
                                  style:TextStyle(fontSize:12,fontWeight:FontWeight.w400,color:FrontendConfigs.kAppGreyColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 13),
                            AttendeeRow(
                              imagePaths: [
                               "assets/images/avatar_three.png",
                               "assets/images/avatar_two.png",
                               "assets/images/avatar_four.png",
                               "assets/images/avatar_one.png",

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),

              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 8.0,
                dashColor: Color(0xffC6C8CC),
                dashRadius: 0.0,
                dashGapLength: 8.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
