// // // import 'package:flutter/material.dart';
// // // import 'package:table_calendar/table_calendar.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:flutter_localizations/flutter_localizations.dart';
// // // import 'account.dart';
// // // import 'dashboard.dart';

// // // void main() {
// // //   runApp(PeriodTrackerApp());
// // // }

// // // class PeriodTrackerApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       locale: Locale('th'),
// // //       supportedLocales: [
// // //         Locale('th', ''),
// // //         Locale('en', ''),
// // //       ],
// // //       localizationsDelegates: [
// // //         GlobalMaterialLocalizations.delegate,
// // //         GlobalWidgetsLocalizations.delegate,
// // //         GlobalCupertinoLocalizations.delegate,
// // //       ],
// // //       home: DashboardPage(),
// // //     );
// // //   }
// // // }

// // // class PeriodTrackerHome extends StatefulWidget {
// // //   @override
// // //   _PeriodTrackerHomeState createState() => _PeriodTrackerHomeState();
// // // }

// // // class _PeriodTrackerHomeState extends State<PeriodTrackerHome> {
// // //   CalendarFormat _calendarFormat = CalendarFormat.month;
// // //   DateTime _focusedDay = DateTime.now();
// // //   Set<DateTime> _selectedDays = {};
// // //   int _selectedIndex = 0;
// // //   int _lastPeriodDays = 5;

// // //   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
// // //     setState(() {
// // //       if (_selectedDays.contains(selectedDay)) {
// // //         _selectedDays.remove(selectedDay);
// // //       } else {
// // //         _selectedDays.add(selectedDay);
// // //       }
// // //     });
// // //   }

// // //   void _calculateNextPeriod() {
// // //     if (_selectedDays.isNotEmpty) {
// // //       DateTime lastPeriodDate = _selectedDays.reduce((a, b) => a.isAfter(b) ? a : b);
// // //       DateTime nextPeriod = lastPeriodDate.add(Duration(days: 28));
// // //       DateTime ovulationDay = lastPeriodDate.add(Duration(days: 14));
      
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(
// // //           builder: (context) => ResultPage(
// // //             nextPeriod: nextPeriod,
// // //             ovulationDay: ovulationDay,
// // //             periodDays: _lastPeriodDays,
// // //           ),
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   void _onItemTapped(int index) {
// // //     if (index == 0) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => DashboardPage()),
// // //       );
// // //     } else if (index == 1) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
// // //       );
// // //     } else if (index == 2) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => AccountPage()),
// // //       );
// // //     } else {
// // //       setState(() {
// // //         _selectedIndex = index;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('ติดตามรอบเดือน'),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               scrollDirection: Axis.vertical,
// // //               child: Column(
// // //                 children: List.generate(12, (index) {
// // //                   DateTime firstDayOfMonth = DateTime(DateTime.now().year, index + 1, 1);
// // //                   return TableCalendar(
// // //                     focusedDay: firstDayOfMonth,
// // //                     firstDay: DateTime(2000),
// // //                     lastDay: DateTime(2100),
// // //                     calendarFormat: CalendarFormat.month,
// // //                     selectedDayPredicate: (day) {
// // //                       return _selectedDays.contains(day) && day.month == firstDayOfMonth.month; // ซ่อนการเลือกวันที่ข้ามเดือน
// // //                     },
// // //                     onDaySelected: _onDaySelected,
// // //                     locale: 'th',
// // //                     calendarStyle: CalendarStyle(
// // //                       isTodayHighlighted: true,
// // //                       selectedDecoration: BoxDecoration(
// // //                         color: Colors.pinkAccent,
// // //                         shape: BoxShape.circle,
// // //                       ),
// // //                       outsideTextStyle: TextStyle(color: Colors.transparent), // ซ่อนตัวเลขของวันที่จากเดือนก่อนหน้าและถัดไป
// // //                     ),
// // //                     availableGestures: AvailableGestures.none, // ปิดการเลื่อนข้ามเดือน
// // //                     headerStyle: HeaderStyle(
// // //                       formatButtonVisible: false,
// // //                       titleCentered: true,
// // //                       titleTextFormatter: (date, locale) {
// // //                         return DateFormat('MMMM yyyy', locale).format(date);
// // //                       },
// // //                     ),
// // //                     daysOfWeekStyle: DaysOfWeekStyle(
// // //                       weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
// // //                       weekendStyle: TextStyle(fontWeight: FontWeight.bold),
// // //                     ),
// // //                   );
// // //                 }),
// // //               ),
// // //             ),
// // //           ),
// // //           SizedBox(height: 20),
// // //           ElevatedButton(
// // //             onPressed: _calculateNextPeriod,
// // //             child: Text("คำนวณรอบเดือน"),
// // //           ),
// // //         ],
// // //       ),
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         currentIndex: _selectedIndex,
// // //         onTap: _onItemTapped,
// // //         items: [
// // //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
// // //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
// // //           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class ResultPage extends StatefulWidget {
// // //   final DateTime nextPeriod;
// // //   final DateTime ovulationDay;
// // //   final int periodDays;

// // //   ResultPage({required this.nextPeriod, required this.ovulationDay, required this.periodDays});

// // //   @override
// // //   _ResultPageState createState() => _ResultPageState();
// // // }

// // // class _ResultPageState extends State<ResultPage> {
// // //   int _selectedIndex = 0;

// // //   String formatThaiDate(DateTime date) {
// // //     final thaiDate = DateFormat('d MMMM yyyy', 'th');
// // //     return thaiDate.format(date);
// // //   }

// // //   void _onItemTapped(int index) {
// // //     if (index == 0) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => DashboardPage()),
// // //       );
// // //     } else if (index == 1) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
// // //       );
// // //     } else if (index == 2) {
// // //       Navigator.push(
// // //         context,
// // //         MaterialPageRoute(builder: (context) => AccountPage()),
// // //       );
// // //     } else {
// // //       setState(() {
// // //         _selectedIndex = index;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         currentIndex: _selectedIndex,
// // //         onTap: _onItemTapped,
// // //         items: [
// // //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
// // //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
// // //           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
// // //         ],
// // //       ),
// // //       appBar: AppBar(title: Text("รายละเอียดรอบเดือน")),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: EdgeInsets.all(16.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               TableCalendar(
// // //                 focusedDay: DateTime.now(),
// // //                 firstDay: DateTime(2000),
// // //                 lastDay: DateTime(2100),
// // //                 calendarFormat: CalendarFormat.month,
// // //                 locale: 'th',
// // //                 calendarStyle: CalendarStyle(
// // //                   todayDecoration: BoxDecoration(
// // //                     color: Colors.blueAccent,
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   selectedDecoration: BoxDecoration(
// // //                     color: Colors.pinkAccent,
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   markerDecoration: BoxDecoration(
// // //                     border: Border.all(color: Colors.red, width: 2, style: BorderStyle.solid),
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   outsideTextStyle: TextStyle(color: Colors.transparent), // ซ่อนวันที่จากเดือนก่อนหน้าและถัดไป
// // //                 ),
// // //                 selectedDayPredicate: (day) {
// // //                   return day.isAtSameMomentAs(widget.nextPeriod) ||
// // //                       (day.isAfter(widget.nextPeriod) && day.isBefore(widget.nextPeriod.add(Duration(days: widget.periodDays))));
// // //                 },
// // //                 availableGestures: AvailableGestures.none, // ปิดการเลื่อนข้ามเดือน
// // //                 headerStyle: HeaderStyle(
// // //                   formatButtonVisible: false,
// // //                   titleCentered: true,
// // //                   titleTextFormatter: (date, locale) {
// // //                     return DateFormat('MMMM yyyy', locale).format(date);
// // //                   },
// // //                 ),
// // //               ),
// // //               SizedBox(height: 20),
// // //               Text("วันคาดการณ์รอบเดือนถัดไป: ${formatThaiDate(widget.nextPeriod)}", 
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //               SizedBox(height: 10),
// // //               Text("วันตกไข่: ${formatThaiDate(widget.ovulationDay)}", 
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // //               SizedBox(height: 10),
// // //               Text("อีก ${widget.ovulationDay.difference(DateTime.now()).inDays} วันจะถึงวันตกไข่", 
// // //                 style: TextStyle(fontSize: 16)),
// // //               SizedBox(height: 10),
// // //               Text("โอกาสตั้งครรภ์สูงในช่วงตกไข่", 
// // //                 style: TextStyle(fontSize: 16, color: Colors.redAccent)),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }






// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'account.dart';
// import 'dashboard.dart';

// void main() {
//   runApp(PeriodTrackerApp());
// }

// class PeriodTrackerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: Locale('th'),
//       supportedLocales: [
//         Locale('th', ''),
//         Locale('en', ''),
//       ],
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home: DashboardPage( 
//         nextPeriod: DateTime.now().add(Duration(days: 28)), 
//         ovulationDay: DateTime.now().add(Duration(days: 14)), 
//     ),
//     );
//   }
// }

// class PeriodTrackerHome extends StatefulWidget {
//   @override
//   _PeriodTrackerHomeState createState() => _PeriodTrackerHomeState();
// }

// class _PeriodTrackerHomeState extends State<PeriodTrackerHome> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   Set<DateTime> _selectedDays = {};
//   int _selectedIndex = 0;
//   int _lastPeriodDays = 5;

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       // Don't allow selection of days in the future
//       if (selectedDay.isAfter(DateTime.now())) return;
      
//       // Toggle selection
//       if (_selectedDays.contains(selectedDay)) {
//         _selectedDays.remove(selectedDay);
//       } else {
//         _selectedDays.add(selectedDay);
//       }
//     });
//   }

//   void _calculateNextPeriod() {
//     if (_selectedDays.isNotEmpty) {
//       DateTime lastPeriodDate = _selectedDays.reduce((a, b) => a.isAfter(b) ? a : b);
//       DateTime nextPeriod = lastPeriodDate.add(Duration(days: 28));
//       DateTime ovulationDay = lastPeriodDate.add(Duration(days: 14));
      
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultPage(
//             nextPeriod: nextPeriod,
//             ovulationDay: ovulationDay,
//             periodDays: _lastPeriodDays,
//             selectedDays: _selectedDays,
//           ),
//         ),
//       );
//     }
//   }

//   void _onItemTapped(int index) {
//     if (index == 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardPage(
//           nextPeriod: DateTime.now().add(Duration(days: 28)), // คำนวณจากรอบเดือนจริง
//           ovulationDay: DateTime.now().add(Duration(days: 14)),
//         )),
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AccountPage()),
//       );
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ติดตามรอบเดือน'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: List.generate(12, (index) {
//                   DateTime firstDayOfMonth = DateTime(DateTime.now().year, index + 1, 1);
//                   return TableCalendar(
//                     focusedDay: firstDayOfMonth,
//                     firstDay: DateTime(2000),
//                     lastDay: DateTime(2100),
//                     calendarFormat: CalendarFormat.month,
//                     selectedDayPredicate: (day) {
//                       return _selectedDays.contains(day) && day.month == firstDayOfMonth.month;
//                     },
//                     onDaySelected: _onDaySelected,
//                     locale: 'th',
//                     calendarStyle: CalendarStyle(
//                       // Customize today's appearance - solid black circle
//                       todayDecoration: BoxDecoration(
//                         color: Colors.black,
//                         shape: BoxShape.circle,
//                       ),
//                       todayTextStyle: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       // Customize selected days appearance - solid red circle
//                       selectedDecoration: BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                       selectedTextStyle: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       outsideTextStyle: TextStyle(color: Colors.transparent),
//                     ),
//                     availableGestures: AvailableGestures.none,
//                     headerStyle: HeaderStyle(
//                       formatButtonVisible: false,
//                       titleCentered: true,
//                       titleTextFormatter: (date, locale) {
//                         return DateFormat('MMMM yyyy', locale).format(date);
//                       },
//                     ),
//                     daysOfWeekStyle: DaysOfWeekStyle(
//                       weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
//                       weekendStyle: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _calculateNextPeriod,
//             child: Text("คำนวณรอบเดือน"),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
//           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
//         ],
//       ),
//     );
//   }
// }

// class ResultPage extends StatefulWidget {
//   final DateTime nextPeriod;
//   final DateTime ovulationDay;
//   final int periodDays;
//   final Set<DateTime> selectedDays;

//   ResultPage({
//     required this.nextPeriod, 
//     required this.ovulationDay, 
//     required this.periodDays,
//     required this.selectedDays,
//   });

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   int _selectedIndex = 0;

//   String formatThaiDate(DateTime date) {
//     final thaiDate = DateFormat('d MMMM yyyy', 'th');
//     return thaiDate.format(date);
//   }

//   void _onItemTapped(int index) {
//     if (index == 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => DashboardPage(
//           nextPeriod: DateTime.now().add(Duration(days: 28)), // คำนวณจากรอบเดือนจริง
//           ovulationDay: DateTime.now().add(Duration(days: 14)),
//         )),
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AccountPage()),
//       );
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Calculate predicted period days
//     Set<DateTime> predictedPeriodDays = {};
//     for (int i = 0; i < widget.periodDays; i++) {
//       predictedPeriodDays.add(widget.nextPeriod.add(Duration(days: i)));
//     }

//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
//           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
//           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
//         ],
//       ),
//       appBar: AppBar(title: Text("รายละเอียดรอบเดือน")),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Using a custom calendar builder to handle different marker types
//               TableCalendar(
//                 focusedDay: DateTime.now(),
//                 firstDay: DateTime(2000),
//                 lastDay: DateTime(2100),
//                 calendarFormat: CalendarFormat.month,
//                 locale: 'th',
//                 calendarStyle: CalendarStyle(
//                   // Base today style - will be overridden by calendarBuilders if needed
//                   todayDecoration: BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                   ),
//                   todayTextStyle: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   // We'll handle most styling with calendarBuilders
//                   outsideTextStyle: TextStyle(color: Colors.transparent),
//                 ),
//                 // Custom calendar builders for specialized day marking
//                 calendarBuilders: CalendarBuilders(
//                   // Past period days - solid red circles
//                   selectedBuilder: (context, date, _) {
//                     return Center(
//                       child: Container(
//                         width: 36,
//                         height: 36,
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${date.day}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   // Today marker - solid black circle
//                   todayBuilder: (context, date, _) {
//                     // Check if today is also a special day (period or ovulation)
//                     if (widget.selectedDays.contains(date)) {
//                       return Center(
//                         child: Container(
//                           width: 36,
//                           height: 36,
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Text(
//                               '${date.day}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     } else if (date.isAtSameMomentAs(widget.ovulationDay)) {
//                       return Center(
//                         child: Container(
//                           width: 36,
//                           height: 36,
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             border: Border.all(color: Colors.green, width: 2),
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Text(
//                               '${date.day}',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     } else if (predictedPeriodDays.contains(date)) {
//                       // ถ้าวันนี้เป็นวันที่คาดการณ์ว่าจะมีประจำเดือน เราจะแสดงวงกลมกลวงสีแดงแต่ยังคงแสดงตัวเลขวันที่ด้วย
//                       return Center(
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             // วงกลมสีแดงกลวง
//                             Container(
//                               width: 36,
//                               height: 36,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 border: Border.all(color: Colors.red, width: 2),
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             // วงกลมดำทึบสำหรับวันนี้
//                             Container(
//                               width: 28,
//                               height: 28,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   '${date.day}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
                    
//                     return Center(
//                       child: Container(
//                         width: 36,
//                         height: 36,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${date.day}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   // Ovulation day - hollow green circle
//                   singleMarkerBuilder: (context, date, _) {
//                     if (date.isAtSameMomentAs(widget.ovulationDay) && !date.isAtSameMomentAs(DateTime.now())) {
//                       return Container(
//                         width: 36,
//                         height: 36,
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                           border: Border.all(color: Colors.green, width: 2),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${date.day}',
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                     return null;
//                   },
//                   // Predicted period days - red circle border
//                   defaultBuilder: (context, date, _) {
//                     if (predictedPeriodDays.contains(date) && 
//                         !date.isAtSameMomentAs(DateTime.now()) && 
//                         !date.isAtSameMomentAs(widget.ovulationDay) &&
//                         !widget.selectedDays.contains(date)) {
//                       // แสดงตัวเลขปกติพร้อมวงกลมสีแดงกลวงล้อมรอบ
//                       return Center(
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             // วงกลมสีแดงกลวง
//                             Container(
//                               width: 36,
//                               height: 36,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 border: Border.all(color: Colors.red, width: 2),
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             // ตัวเลขวันที่ธรรมดา
//                             Text(
//                               '${date.day}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                     return null;
//                   },
//                 ),
//                 selectedDayPredicate: (day) {
//                   return widget.selectedDays.contains(day);
//                 },
//                 availableGestures: AvailableGestures.none,
//                 headerStyle: HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                   titleTextFormatter: (date, locale) {
//                     return DateFormat('MMMM yyyy', locale).format(date);
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Legend for the calendar
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("คำอธิบายสัญลักษณ์:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Text("วันที่มีประจำเดือน"),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             border: Border.all(color: Colors.green, width: 2),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Text("วันตกไข่"),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             border: Border.all(color: Colors.red, width: 2),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Text("วันที่คาดการณ์ประจำเดือน"),
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         SizedBox(width: 8),
//                         Text("วันนี้"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'account.dart';
import 'dashboard.dart';
// import 'db/mymain.dart';

void main() {
  runApp(PeriodTrackerApp());
}

class PeriodTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('th'),
      supportedLocales: [
        Locale('th', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: DashboardPage(
        nextPeriod: DateTime.now().add(Duration(days: 28)),
        ovulationDay: DateTime.now().add(Duration(days: 14)),
      ),
    );
  }
}

class PeriodTrackerHome extends StatefulWidget {
  @override
  _PeriodTrackerHomeState createState() => _PeriodTrackerHomeState();
}

class _PeriodTrackerHomeState extends State<PeriodTrackerHome> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Set<DateTime> _selectedDays = {};
  int _selectedIndex = 0;
  int _lastPeriodDays = 5;
  DateTime? _nextPeriod;
  DateTime? _ovulationDay;
  Set<DateTime> _predictedPeriodDays = {};

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      // Don't allow selection of days in the future
      if (selectedDay.isAfter(DateTime.now())) return;

      // Toggle selection
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      // Calculate next period and ovulation day
      if (_selectedDays.isNotEmpty) {
        DateTime lastPeriodDate = _selectedDays.reduce((a, b) => a.isAfter(b) ? a : b);
        _nextPeriod = lastPeriodDate.add(Duration(days: 28));
        _ovulationDay = lastPeriodDate.add(Duration(days: 14));

        // Calculate predicted period days
        _predictedPeriodDays = {};
        for (int i = 0; i < _lastPeriodDays; i++) {
          _predictedPeriodDays.add(_nextPeriod!.add(Duration(days: i)));
        }
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            nextPeriod: _nextPeriod ?? DateTime.now().add(Duration(days: 28)),
            ovulationDay: _ovulationDay ?? DateTime.now().add(Duration(days: 14)),
          ),
        ),
      );
    } else if (index == 1) {
      // Stay on the current page
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ติดตามรอบเดือน'),
        leading: null, // This removes the default back button
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(12, (index) {
                  DateTime firstDayOfMonth = DateTime(DateTime.now().year, index + 1, 1);
                  return TableCalendar(
                    focusedDay: firstDayOfMonth,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return _selectedDays.contains(day) && day.month == firstDayOfMonth.month;
                    },
                    onDaySelected: _onDaySelected,
                    locale: 'th',
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      outsideTextStyle: TextStyle(color: Colors.transparent),
                    ),
                    availableGestures: AvailableGestures.none,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextFormatter: (date, locale) {
                        return DateFormat('MMMM yyyy', locale).format(date);
                      },
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, _) {
                        return Center(
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, date, _) {
                        if (_selectedDays.contains(date)) {
                          return Center(
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (_ovulationDay != null && date.isAtSameMomentAs(_ovulationDay!)) {
                          return Center(
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.green, width: 2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (_predictedPeriodDays.contains(date)) {
                          return Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.red, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Center(
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      singleMarkerBuilder: (context, date, _) {
                        if (_ovulationDay != null && date.isAtSameMomentAs(_ovulationDay!) && !date.isAtSameMomentAs(DateTime.now())) {
                          return Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.green, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                      defaultBuilder: (context, date, _) {
                        if (_predictedPeriodDays.contains(date) &&
                            !date.isAtSameMomentAs(DateTime.now()) &&
                            _ovulationDay != null &&
                            !date.isAtSameMomentAs(_ovulationDay!) &&
                            !_selectedDays.contains(date)) {
                          return Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.red, width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("คำอธิบายสัญลักษณ์:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text("วันที่มีประจำเดือน", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.green, width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text("วันตกไข่", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.red, width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text("วันที่คาดการณ์ประจำเดือน", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text("วันนี้", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
        ],
      ),
    );
  }
}

