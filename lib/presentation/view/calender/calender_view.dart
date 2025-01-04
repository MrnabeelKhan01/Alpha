import 'package:alpha/configurations/frontend_configs.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import '../../elements/toggle.dart';
import 'layout/widgets/event_row.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  List<Appointment> _appointmentDetails = <Appointment>[];

  final CalendarView _calendarView = CalendarView.month;
  List<Appointment> _getAppointments() {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));
    final DateTime nextWeek = today.add(Duration(days: 7));

    return [
      // Today's Appointments
      Appointment(
        subject: "Brandbook and Guidebook",
        startTime: DateTime(today.year, today.month, today.day, 9, 0),
        endTime: DateTime(today.year, today.month, today.day, 10, 0),
        color: Color(0xffFF9640),
        isAllDay: false,
      ),
      Appointment(
        subject: "App Development",
        startTime: DateTime(today.year, today.month, today.day, 11, 0),
        endTime: DateTime(today.year, today.month, today.day, 12, 30),
        color: Color(0xff31D482),
        isAllDay: false,
      ),
      Appointment(
        subject: "Landing Page",
        startTime: DateTime(today.year, today.month, today.day, 14, 0),
        endTime: DateTime(today.year, today.month, today.day, 15, 30),
        color: Color(0xff826AF9),
        isAllDay: false,
      ),

      // Tomorrow's Appointments
      Appointment(
        subject: "Project Rocket",
        startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 10, 0),
        endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 11, 0),
        color: Color(0xffFFD422),
        isAllDay: false,
      ),
      Appointment(
        subject: "Design Meeting",
        startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 13, 0),
        endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 14, 30),
        color: Color(0xff31D482),
        isAllDay: false,
      ),
      Appointment(
        subject: "Client Call",
        startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 16, 0),
        endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 17, 0),
        color: Color(0xff826AF9),
        isAllDay: false,
      ),

      // Next Week's Appointments
      Appointment(
        subject: "Sprint Planning",
        startTime: DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 9, 0),
        endTime: DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 11, 0),
        color: Color(0xffFFD422),
        isAllDay: false,
      ),
      Appointment(
        subject: "Team Review",
        startTime:
        DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 12, 30),
        endTime: DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 14, 0),
        color: Color(0xff31D482),
        isAllDay: false,
      ),
      Appointment(
        subject: "Marketing Update",
        startTime: DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 15, 0),
        endTime: DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 16, 0),
        color: Color(0xff826AF9),
        isAllDay: false,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:10,),
                Text(
                  "Calendar",
                  style: FrontendConfigs.kAppHeadingStyle,
                ),
                SizedBox(height:10,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButton(),
                    Container(
                      height:48,
                      width:48,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(14),
                          boxShadow:[
                            FrontendConfigs.kAppBoxShadow
                          ],
                          color:FrontendConfigs.kAppPrimaryColor,
                          border:Border.all(color:FrontendConfigs.kAppWhiteColor,width:1.5)
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset("assets/icons/add_icon.svg"),
                      ),
                    )
                  ],
                ),
                SizedBox(height:16,),
                Container(
                  height: 360,
                  decoration: BoxDecoration(
                      boxShadow: [
                        FrontendConfigs.kAppBoxShadow,
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: FrontendConfigs.kAppWhiteColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SfCalendar(
                      view: _calendarView,
                      dataSource: _getCalendarDataSource(),
                      onTap: calendarTapped,
                      viewHeaderStyle: ViewHeaderStyle(
                        dayTextStyle: TextStyle(
                          color: FrontendConfigs.kAppGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      cellBorderColor: Colors.transparent,
                      todayTextStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF5F7FA).withOpacity(0.4),
                        backgroundColor: Colors.transparent,
                      ),
                      selectionDecoration: BoxDecoration(
                        color:
                        FrontendConfigs.kAppPrimaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      headerStyle: CalendarHeaderStyle(
                        textAlign: TextAlign.center,
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      showNavigationArrow: true,
                      backgroundColor: Colors.white,
                      monthCellBuilder: monthCellBuilder,
                      monthViewSettings: MonthViewSettings(
                        appointmentDisplayCount: 3,
                        // showAgenda: true,

                        agendaItemHeight: 30,
                        appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                        showTrailingAndLeadingDates: true,
                        agendaStyle: AgendaStyle(
                          backgroundColor: Color(0xffF2F4F7),
                        ),
                        monthCellStyle: MonthCellStyle(
                          todayBackgroundColor:
                          FrontendConfigs.kAppPrimaryColor,

                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: FrontendConfigs.kAppPrimaryColor),
                          // Grey background
                        ),
                        // showTrailingAndLeadingDates: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10,),
                Text(
                  "Upcoming",
                  style: FrontendConfigs.kAppHeadingStyle,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(2),
                  itemCount: _appointmentDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Retrieve the appointment
                    var appointment = _appointmentDetails[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Time Column
                            SizedBox(
                              height: 140,
                              width: 55,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: _appointmentDetails.length,
                                itemBuilder: (context, index) {
                                  var appointment = _appointmentDetails[index];
                                  return Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 35.0),
                                        child: Text(
                                          DateFormat('HH:mm')
                                              .format(appointment.startTime),
                                          style: FrontendConfigs.kAppTitleStyle,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Dotted Line
                                  DottedLine(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.center,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 8.0,
                                    dashColor: Color(0xffC6C8CC),
                                  ),
                                  SizedBox(height: 2),
                                  // Event Card
                                  Container(
                                    height: 116,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        FrontendConfigs.kAppBoxShadow
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      color: FrontendConfigs.kAppWhiteColor,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 18.0),
                                          child: Container(
                                            width: 4,
                                            height: 84,
                                            decoration: BoxDecoration(
                                              color: appointment.color,
                                              borderRadius:
                                              BorderRadius.circular(2),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              // Event Title
                                              Text(
                                                appointment.subject,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  // Event Category/Type
                                                  Text(
                                                    "Design",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color: FrontendConfigs
                                                          .kAppGreyColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  // Timer Icon
                                                  SvgPicture.asset(
                                                      "assets/icons/timer_icon.svg"),
                                                  const SizedBox(width: 4),
                                                  // Event Duration
                                                  Text(
                                                    DateFormat('HH:mm').format(
                                                        appointment.endTime),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color: FrontendConfigs
                                                          .kAppGreyColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 13),
                                              // Attendee Row
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
                                  SizedBox(height: 2),
                                  DottedLine(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.center,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 8.0,
                                    dashColor: Color(0xffC6C8CC),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                   Divider(height: 10,color:Colors.transparent,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointmentDetails = _getAppointmentsForDay(calendarTapDetails.date!);
      });
    }
  }

  List<Appointment> _getAppointmentsForDay(DateTime date) {
    return _getAppointments().where((appointment) {
      return isSameDay(appointment.startTime, date);
    }).toList();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Get Data Source for Calendar
  CalendarDataSource _getCalendarDataSource() {
    return MeetingDataSource(_getAppointments());
  }


}



class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
  return Column(
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Color(0xffF5F7FA)),
        child: Center(child: Text(details.date.day.toString())),
      ),
    ],
  );
}
