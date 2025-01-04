import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../configurations/frontend_configs.dart';

class StatisticsCard extends StatefulWidget {
  const StatisticsCard({
    super.key,
  });

  @override
  State<StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  String dropdownValue = "This Week";

  List<String> overViewList = ['This Week', 'This Month', 'This Year'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              FrontendConfigs.kAppBoxShadow,
            ],
            borderRadius: BorderRadius.circular(16),
            color: FrontendConfigs.kAppWhiteColor),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, top: 12, bottom: 28, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Statistics",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/more_icon.svg"),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: FrontendConfigs.kAppBorderColor),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
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
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Share",
                            style: FrontendConfigs.kAppTitleStyle,
                          ),
                          Text(
                            "254,68K",
                            style: FrontendConfigs.kAppSubHeadingStyle,
                          ),
                        ],
                      ),
                      SizedBox(width: 18),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                FrontendConfigs.kAppGreenColor.withOpacity(0.10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/increase_icon.svg"),
                              SizedBox(width: 6),
                              Text(
                                "6.18%",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: FrontendConfigs.kAppGreenColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Likes",
                        style: FrontendConfigs.kAppTitleStyle,
                      ),
                      Text(
                        "34,31",
                        style: FrontendConfigs.kAppSubHeadingStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 240,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipPadding: const EdgeInsets.all(8),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            'Value: ${rod.toY}',
                            const TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: "\nAdditional Info",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          );
                        },
                      ),
                      touchCallback:
                          (FlTouchEvent event, BarTouchResponse? response) {
                        if (event is FlTapUpEvent && response != null) {
                          // Handle touch event here
                        }
                      },
                    ),
                    barGroups: [
                      makeGroupData(0, 20, 30, 40),
                      makeGroupData(0, 40, 20, 40),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, _) {
                            const days = ['Mon', 'Tue'];
                            return Text(
                              days[value.toInt()],
                              style: TextStyle(
                                color: FrontendConfigs.kAppTextColor,
                                fontSize: 12,
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
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Color(0xff826AF9),
          width: 16,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        BarChartRodData(
          toY: y2,
          color: Color(0xffFFD422),
          width: 16,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        BarChartRodData(
          toY: y3,
          color: Color(0xffFF9640),
          width: 16,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
