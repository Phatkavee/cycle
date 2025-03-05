import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'package:mysql1/mysql1.dart';

Future<void> saveUserData() async {
  var conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost', 
    port: 3306,
    user: 'youruser',
    password: 'yourpassword',
    db: 'cycleapp'
  ));

  await conn.query(
    'INSERT INTO users (name, age, email, status, medical_condition, weight, height) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [_name, _age, _email, _status, _medicalCondition, _weight, _height]
  );

  await conn.close();
}

Future<void> saveUserData(String name, int age, String email, String status, double weight, double height) async {
  var conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    db: 'emp'
  ));

  await conn.query(
    'INSERT INTO emp (name, age, email, status, weight, height) VALUES (?, ?, ?, ?, ?, ?)', 
    [name, age, email, status, weight, height]
  );
  await conn.close();
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _name = "";
  int _age = 18;
  String _email = "";
  String _status = "โสด";
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
              SizedBox(height: 20),
         
              ElevatedButton(
                onPressed: () async {
                  print("กำลังบันทึกข้อมูล: $_name, $_age, $_email, $_status, $_weight, $_height");
                  try {
                    await saveUserData(_name, _age, _email, _status, _weight, _height);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("บันทึกข้อมูลสำเร็จ!")),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("เกิดข้อผิดพลาด: $e")),
                    );
                  }
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
