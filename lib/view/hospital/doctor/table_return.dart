import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';


class ReturnTableScreen extends StatefulWidget {
  const ReturnTableScreen({super.key});

  @override
  State<ReturnTableScreen> createState() => _ReturnTableScreenState();
}

class _ReturnTableScreenState extends State<ReturnTableScreen> {
  final List<String> _daysOptions = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];

  List<Map<String, dynamic>> rows = [
    {
      "day": null,
      "start": "",
      "end": "",
      "visitLimit": "",
    }
  ];

  void _addNewRow() {
    setState(() {
      rows.add({
        "day": null,
        "start": "",
        "end": "",
        "visitLimit": "",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Table Section
            Expanded(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                    },
                    children: [
                      // Header Row
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Color(0xffbac3ef),
                        ),
                        children: [
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Days",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Start",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                "End",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Visit L.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Dynamic Rows
                      ...rows.map((row) {
                        return TableRow(
                          children: [
                            SizedBox(
                              height: 30,
                              child: CustomDropdown2(
                                items: _daysOptions,
                                selectedItem: row["day"],
                                onChanged: (value) {
                                  setState(() {
                                    row["day"] = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: TextField(
                                onChanged: (value) {
                                  row["start"] = value;
                                },
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: TextField(
                                onChanged: (value) {
                                  row["end"] = value;
                                },
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: TextField(
                                onChanged: (value) {
                                  row["visitLimit"] = value;
                                },
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
            // Add Button Section
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.black,
                ),
                onPressed: _addNewRow,
              ),
            ),
          ],
        ),
      );
     
  }
}



 


 

class CustomDropdown2 extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  //final String labelText;
  final bool isRequired;
  final String placeholder;

  const CustomDropdown2({
    Key? key,
    this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    //required this.labelText,
    this.isRequired = false,
    this.placeholder = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 1),
        SizedBox(
          height: 28,
          width: 150,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                // horizontal: 10,
                // vertical: 10,
                horizontal: 7,
                vertical: 2,
              ),
            ),
            value: selectedItem,
            items: [
              DropdownMenuItem<String>(
                value: null,
                child: Text(
                  placeholder,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ...items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
