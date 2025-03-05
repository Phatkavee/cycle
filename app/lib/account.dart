import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _name = "";
  int _age = 18;
  String _email = "";
  String _status = "โสด";
  String _medicalCondition = "ไม่มี";
  bool _cycleReminderEnabled = true;
  double _weight = 50.0;
  double _height = 160.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บัญชีผู้ใช้"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ชื่อผู้ใช้:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: "กรอกชื่อของคุณ"),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("อายุ:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: _age,
                items: [
                  for (int i = 12; i <= 60; i++)
                    DropdownMenuItem(value: i, child: Text("$i ปี"))
                ],
                onChanged: (value) {
                  setState(() {
                    _age = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("น้ำหนัก (กก.):", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "กรอกน้ำหนักของคุณ"),
                onChanged: (value) {
                  setState(() {
                    _weight = double.tryParse(value) ?? 50.0;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("ส่วนสูง (ซม.):", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "กรอกส่วนสูงของคุณ"),
                onChanged: (value) {
                  setState(() {
                    _height = double.tryParse(value) ?? 160.0;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("อีเมล:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: "กรอกอีเมลของคุณ"),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("สถานะ:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: _status,
                items: [
                  "โสด", "มีแฟน", "แต่งงานแล้ว", "อื่นๆ"
                ].map((status) => DropdownMenuItem(value: status, child: Text(status))).toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              Text("โรคประจำตัว:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: "เช่น เบาหวาน, ความดัน ฯลฯ"),
                onChanged: (value) {
                  setState(() {
                    _medicalCondition = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("บันทึกข้อมูลสำเร็จ!")),
                  );
                },
                child: Center(
                  child: Text("บันทึก")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

