import 'package:alpha/configurations/frontend_configs.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              FrontendConfigs.kAppBoxShadow,
            ],
            borderRadius: BorderRadius.circular(16),
            color: FrontendConfigs.kAppWhiteColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      )),
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/more_icon.svg"),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior:Clip.none,
                    children: [
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 120.0,
                        lineWidth: 16.0,
                        percent: 0.42,
                        center: Container(
                            decoration: BoxDecoration(
                                color: FrontendConfigs.kAppWhiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 50,
                                      color: Colors.black.withOpacity(0.14)),
                                  BoxShadow(
                                      offset: Offset(-4, -4),
                                      blurRadius: 16,
                                      color: Colors.white.withOpacity(0.9))
                                ],
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(
                                "assets/images/woman_avator.png",
                                height: 60,
                              ),
                            )),
                        backgroundColor: Color(0xffFFD422),
                        progressColor: Color(0xff826AF9),
                      ),
                      Positioned(
                        top:20,
                        left:10,
                        child: Container(
                          height:50,
                          width:50,
                          decoration:BoxDecoration(
                            shape:BoxShape.circle,
                            boxShadow:[
                              BoxShadow(
                                offset:Offset(4, 8),
                                blurRadius:25,
                                color:Colors.black.withOpacity(0.10)
                              )
                            ],
                            color:FrontendConfigs.kAppWhiteColor
                          ),
                          child:Center(child: Text("56%")),
                        ),
                      ),
                      Positioned(
                        bottom:30,
                        right:10,
                        child: Container(
                          height:50,
                          width:50,
                          decoration:BoxDecoration(
                              shape:BoxShape.circle,
                              boxShadow:[
                                BoxShadow(
                                    offset:Offset(4, 8),
                                    blurRadius:25,
                                    color:Colors.black.withOpacity(0.10)
                                )
                              ],
                              color:FrontendConfigs.kAppWhiteColor
                          ),
                          child:Center(child: Text("42%")),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              _genderWidget(),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff826AF9), width: 3)),
              ),
              const SizedBox(width: 6),
              Text(
                'Male: ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff637085)),
              ),
              Text(
                '352k',
                style: TextStyle(
                    fontSize: 14,
                    color: FrontendConfigs.kAppTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffFFD422), width: 3)),
              ),
              const SizedBox(width: 6),
              Text(
                'Female: ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: FrontendConfigs.kAppTextColor),
              ),
              Text(
                '884k',
                style: TextStyle(
                    fontSize: 14,
                    color: FrontendConfigs.kAppTextColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
