import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../configurations/frontend_configs.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

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
          padding: const EdgeInsets.only(left:16.0,right:8,top:18,bottom:28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Activity",style:TextStyle(fontSize:20,fontWeight:FontWeight.w600),),
                  IconButton(icon: SvgPicture.asset("assets/icons/more_icon.svg"), onPressed: () {  },),
                ],
              ),
              Row(
                children: [
                  Text(
                    "462,98K",
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
                        Text("3.48%",style:TextStyle(fontSize:15,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppGreenColor),)
                      ],),
                    ),
                  ),

                ],
              ),
              SizedBox(height:28,),
              SizedBox(
                height: 250,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 5,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(

                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const titles = ['M', 'T', 'W', 'T'];
                            if (value.toInt() < titles.length) {
                              return Text(
                                titles[value.toInt()],
                                style: TextStyle(
                                  color: FrontendConfigs.kAppTextColor,
                                  fontSize: 14,
                                ),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: FrontendConfigs.kAppTextColor,
                                fontSize: 10,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 10),
                          FlSpot(1, 15),
                          FlSpot(2, 12),
                          FlSpot(3, 25),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: [Color(0xffFF9640), Color(0xffFF9640)],
                        ),

                        barWidth: 3,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              FrontendConfigs.kAppSecondaryColor.withOpacity(0.2),
                              FrontendConfigs.kAppSecondaryColor.withOpacity(0.1),
                              FrontendConfigs.kAppSecondaryColor.withOpacity(0.02),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (List<LineBarSpot> touchedSpots) {
                          return touchedSpots.map((spot) {
                            return LineTooltipItem(
                              '',
                              const TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: "\n\$1000", style: TextStyle(color: Colors.white)),
                                TextSpan(text: "\n23 August, 2021", style: TextStyle(color: Colors.white)),
                              ],
                            );
                          }).toList();
                        },
                      ),
                      handleBuiltInTouches: true,
                    ),
                  ),
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
