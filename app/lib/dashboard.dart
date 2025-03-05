// // // // import 'package:app/account.dart';
// // // // import 'package:app/main.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:intl/intl.dart';

// // // // class DashboardPage extends StatefulWidget {
// // // //   @override
// // // //   _DashboardPageState createState() => _DashboardPageState();
// // // // }

// // // // class _DashboardPageState extends State<DashboardPage> {
// // // //   int cycleLength = 36;
// // // //   int periodDays = 5;

// // // //   int _selectedIndex = 0;

// // // //   void _onItemTapped(int index) {
// // // //     if (index == 0) {
// // // //       Navigator.push(
// // // //         context,
// // // //         MaterialPageRoute(builder: (context) => DashboardPage()),
// // // //       );
// // // //     } else if (index == 1) {
// // // //       Navigator.push(
// // // //         context,
// // // //         MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
// // // //       );
// // // //     } else if (index == 2) {
// // // //       Navigator.push(
// // // //         context,
// // // //         MaterialPageRoute(builder: (context) => AccountPage()),
// // // //       );
// // // //     } else {
// // // //       setState(() {
// // // //         _selectedIndex = index;
// // // //       });
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text("แดชบอร์ด"),
// // // //       ),
// // // //       body: Padding(
// // // //         padding: EdgeInsets.all(16.0),
// // // //         child: SingleChildScrollView(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Text("รอบเดือนของฉัน", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // // //               SizedBox(height: 10),
// // // //               Row(
// // // //                 children: [
// // // //                   Expanded(
// // // //                     child: Card(
// // // //                       elevation: 3,
// // // //                       child: Padding(
// // // //                         padding: EdgeInsets.all(16.0),
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text("ระยะเวลาของรอบเดือนครั้งที่แล้ว", style: TextStyle(fontSize: 16)),
// // // //                             SizedBox(height: 5),
// // // //                             Text("$cycleLength วัน", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // // //                             SizedBox(height: 5),
// // // //                             Row(
// // // //                               children: [
// // // //                                 Icon(Icons.warning_amber_rounded, color: Colors.orange),
// // // //                                 SizedBox(width: 5),
// // // //                                 Text("ผิดปกติ", style: TextStyle(color: Colors.orange)),
// // // //                               ],
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(width: 10),
// // // //                   Expanded(
// // // //                     child: Card(
// // // //                       elevation: 3,
// // // //                       child: Padding(
// // // //                         padding: EdgeInsets.all(16.0),
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text("ระยะเวลาของประจำเดือนครั้งที่แล้ว", style: TextStyle(fontSize: 16)),
// // // //                             SizedBox(height: 5),
// // // //                             Text("$periodDays วัน", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // // //                             SizedBox(height: 5),
// // // //                             Row(
// // // //                               children: [
// // // //                                 Icon(Icons.check_circle, color: Colors.green),
// // // //                                 SizedBox(width: 5),
// // // //                                 Text("ปกติ", style: TextStyle(color: Colors.green)),
// // // //                               ],
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),

// // // //               Text("จากแนวทางและแหล่งข้อมูลทางการแพทย์", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // //               SizedBox(height: 10),
// // // //               Card(
// // // //                 elevation: 3,
// // // //                 child: Padding(
// // // //                   padding: EdgeInsets.all(16.0),
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Text("รอบเดือนของคุณถือว่า", style: TextStyle(fontSize: 16)),
// // // //                       SizedBox(height: 5),
// // // //                       Text("ปกติ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
// // // //                       SizedBox(height: 5),
// // // //                       Text(
// // // //                         "การเกิดรอบเดือนจะนับตั้งแต่วันแรกที่ประจำเดือนมา จนถึงวันแรกของรอบเดือนถัดไป หากประจำเดือนมาในช่วงปกติ คือ 21-35 วัน ถือว่าเป็นปกติ",
// // // //                         style: TextStyle(fontSize: 14),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       bottomNavigationBar: BottomNavigationBar(
// // // //         currentIndex: _selectedIndex,
// // // //         onTap: _onItemTapped,
// // // //         items: [
// // // //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "หน้าหลัก"),
// // // //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "รอบเดือน"),
// // // //           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "บัญชี"),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }





import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/account.dart';
import 'package:app/main.dart';

class DashboardPage extends StatefulWidget {
  final DateTime nextPeriod;
  final DateTime ovulationDay;

  DashboardPage({required this.nextPeriod, required this.ovulationDay});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int cycleLength = 36;
  int periodDays = 5;
  int _selectedIndex = 0;

  // ฟังก์ชันแปลงวันที่เป็นภาษาไทย
  String formatThaiDate(DateTime date) {
    return DateFormat('d MMM yyyy', 'th_TH').format(date);
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            nextPeriod: DateTime.now().add(Duration(days: 28)), // ตัวอย่าง
            ovulationDay: DateTime.now().add(Duration(days: 14)), // ตัวอย่าง
          ),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PeriodTrackerHome()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แดชบอร์ด"),
        leading: null, // This removes the default back button
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("รอบเดือนของฉัน", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("รอบเดือนถัดไปเริ่ม", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 5),
                            Text("${formatThaiDate(widget.nextPeriod)} ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            // Row(
                            //   children: [
                            //     Icon(Icons.warning_amber_rounded, color: Colors.orange),
                            //     SizedBox(width: 5),
                            //     Text("ผิดปกติ", style: TextStyle(color: Colors.orange)),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("วันตกไข่", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 5),
                            Text("${formatThaiDate(widget.ovulationDay)} ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            // Row(
                            //   children: [
                            //     Icon(Icons.check_circle, color: Colors.green),
                            //     SizedBox(width: 5),
                            //     Text("ปกติ", style: TextStyle(color: Colors.green)),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("วันคาดการณ์รอบเดือนถัดไป: ${formatThaiDate(widget.nextPeriod)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("วันตกไข่: ${formatThaiDate(widget.ovulationDay)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("อีก ${widget.ovulationDay.difference(DateTime.now()).inDays} วันจะถึงวันตกไข่",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("โอกาสตั้งครรภ์สูงในช่วงตกไข่", style: TextStyle(fontSize: 16, color: Colors.redAccent)),
              SizedBox(height: 20),
              Text("จากแนวทางและแหล่งข้อมูลทางการแพทย์",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "การเกิดรอบเดือนจะนับตั้งแต่วันแรกที่ประจำเดือนมา จนถึงวันแรกของรอบเดือนถัดไป หากประจำเดือนมาในช่วงปกติ คือ 21-35 วัน ถือว่าเป็นปกติ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
