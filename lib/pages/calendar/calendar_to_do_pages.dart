import 'dart:ui';

import 'package:comunicate_colegios_app/pages/home/menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarToDoPages extends StatefulWidget {
  static final String routeName = "calendarToDo";
  CalendarToDoPages({Key key}) : super(key: key);

  @override
  _CalendarToDoPagesState createState() => _CalendarToDoPagesState();
}

class _CalendarToDoPagesState extends State<CalendarToDoPages> {
  CalendarController controller;

  @override
  void initState() {
    super.initState();
    controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }

  Container taskList(
      String title, String description, IconData status, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Icon(
            status,
            color: color,
            size: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comunicate app'),
        ),
        drawer: MenuWidget(),
        body: SafeArea(
            child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                    calendarController: controller,
                    calendarStyle: CalendarStyle(
                        weekdayStyle: dayStyle(
                          FontWeight.normal,
                        ),
                        weekendStyle: dayStyle(FontWeight.normal),
                        selectedColor: Color(0xff30374b),
                        todayColor: Color(0xff30374b)),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            color: Color(0xff30384c),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        dowTextBuilder: (date, locate) {
                          return DateFormat.E(locate)
                              .format(date)
                              .substring(0, 1);
                        },
                        weekendStyle: TextStyle(
                            color: Color(0xff30384c),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                      color: Color(0xff30384c),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              "Actividades",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          taskList(
                              'title',
                              'description',
                              Icons.check_circle_outline_rounded,
                              Color(0xff00cf8d)),
                          taskList(
                              'title',
                              'description',
                              Icons.check_circle_outline_rounded,
                              Color(0xffff9e00)),
                          taskList(
                              'title',
                              'description',
                              Icons.check_circle_outline_rounded,
                              Color(0xffff9e00))
                        ],
                      ),
                      // Positioned(
                      //     bottom: 0,
                      //     height: 300,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           gradient: LinearGradient(
                      //               begin: FractionalOffset.topCenter,
                      //               end: FractionalOffset.bottomCenter,
                      //               stops: [
                      //             0.0,
                      //             1.0
                      //           ],
                      //               colors: [
                      //             Color(0xff30384c).withOpacity(0),
                      //             Color(0xff30384c)
                      //           ])),
                      //     )),
                      // Positioned(
                      //   bottom: 40,
                      //   right: 20,
                      //   child: Container(
                      //     padding: EdgeInsets.all(1.0),
                      //     decoration: BoxDecoration(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(40.0)),
                      //         // border: Border.all(
                      //         //     width: 2, color: Theme.of(context).secondaryHeaderColor),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               color: Colors.blueGrey.withOpacity(0.4),
                      //               blurRadius: 2)
                      //         ]),
                      //     child: CircleAvatar(
                      //       radius: 25.0,
                      //       child: Text(
                      //         '+',
                      //         style: TextStyle(fontSize: 40),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
