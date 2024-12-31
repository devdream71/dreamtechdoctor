import 'package:flutter/material.dart';

class AppointTable extends StatelessWidget {
  const AppointTable({super.key});

  // Sample table data
  static const List<Map<String, dynamic>> tableData = [
    {
      'date': '01/01/2024',
      'days': 'Sun',
      'startTime': '10.30 AM',
      'endTime': '05.30 PM',
      'room': '17',
      'visit': '1st',
      'fee': 120.50,
      'p.type': 'online',
    },
 
  ];

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              // Table Header
              const TableRow(
                decoration: BoxDecoration(color: Color(0xff3ea0d9)),
                children: [
                  Center(
                    child: Text("Date",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("Days",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("Start Time",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("End Time",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("Room",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("Visit",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("Fee",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Center(
                    child: Text("P. Type",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                ],
              ),
              // Table Rows
              for (int i = 0; i < tableData.length; i++)
                TableRow(
                  decoration: BoxDecoration(
                    color: i.isOdd ? const Color(0xffe3e7fa) : Colors.white,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['date'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['days'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['startTime'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['endTime'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['room'].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['visit'].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['fee'].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tableData[i]['p.type'].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ));
     
  }
}
