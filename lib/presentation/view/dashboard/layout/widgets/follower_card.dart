import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../configurations/frontend_configs.dart';

class FollowerCard extends StatelessWidget {
  const FollowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Container(
        decoration:BoxDecoration(
          boxShadow: [
            FrontendConfigs.kAppBoxShadow,
          ],
          borderRadius:BorderRadius.circular(16),
          color:FrontendConfigs.kAppWhiteColor
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:10.0,bottom:28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Followers",style:TextStyle(fontSize:20,fontWeight:FontWeight.w600),),
                        IconButton(icon: SvgPicture.asset("assets/icons/more_icon.svg"), onPressed: () {  },),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "254,68K",
                          style: FrontendConfigs.kAppSubHeadingStyle,
                        ),
                        SizedBox(width:18,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FrontendConfigs.kAppGreenColor.withOpacity(0.10)),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:5),
                            child: Row(children: [
                              SvgPicture.asset("assets/icons/increase_icon.svg"),
                              SizedBox(width:6,),
                              Text("6.18%",style:TextStyle(fontSize:15,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppGreenColor),)
                            ],),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:18,),
              SizedBox(
                height: 240,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const titles = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                            return Text(
                              titles[value.toInt()],
                              style: TextStyle(
                                  color:FrontendConfigs.kAppTextColor, fontSize: 12),
                            );
                          },
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: [40, 50, 60, 80, 45, 30, 55]
                        .asMap()
                        .entries
                        .map((entry) => _generateBar(entry.key, entry.value.toDouble()))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                  Column(

                    children: [
                    Text("834",style:TextStyle(fontSize:24,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppGreenColor),),
                    Text("Followers",style:FrontendConfigs.kAppTitleStyle,)
                  ],),
                  Column(
                    children: [
                      Text("152",style:TextStyle(fontSize:24,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppSecondaryColor),),
                      Text("Unfollowed",style:FrontendConfigs.kAppTitleStyle,)
                    ],)
                ],),
              )
                ],
          ),
        ),
      ),
    );
  }
  BarChartGroupData _generateBar(int x, double y) {
    bool isCenter = x == 3;
    double width =16;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isCenter ? FrontendConfigs.kAppSecondaryColor :Color(0xff826AF9),
          width: width,
          borderRadius: BorderRadius.circular( 8),

          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color:Color(0xffF0F1F5),
          ),
        ),
      ],
    );}
}
