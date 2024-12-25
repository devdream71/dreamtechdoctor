import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class ReturnTable_RoomScreen extends StatefulWidget {
  const ReturnTable_RoomScreen({super.key});

  @override
  State<ReturnTable_RoomScreen> createState() => _ReturnTable_RoomScreenState();
}

class _ReturnTable_RoomScreenState extends State<ReturnTable_RoomScreen> {

   final List<String> _DaysOptions = [
    "Online", "Offline",
  ];

  String? _selectedDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.black, // Black border for the entire table
                  width: 1, // Border thickness
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1), // Wider column for Item Name
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(1),
                },
                children: [
                  // Table Header
                  const TableRow(
                    decoration: BoxDecoration(
                      color: Color(0xffbac3ef), // Header background color
                    ),
                    children: [
                      SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "Visit Fee",
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
                            "2nd Time",
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
                            "3rd Time",
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
                            "Payment",
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
                            "Room",
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
                  // Table Rows with TextField and Fixed Height
                  for (int i = 0; i < 1; i++)
                        TableRow(
                      children: [
                        const SizedBox(
                          height: 30,
                          child: 
                           TextField(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
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
                        const SizedBox(
                          height: 30,
                          child: TextField(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
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
                        const SizedBox(
                          height: 30,
                          child: TextField(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
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
                          child: 
                          // TextField(
                          //   style: TextStyle(fontSize: 14, color: Colors.black),
                          //   decoration: InputDecoration(
                          //     focusedBorder: InputBorder.none,
                          //     enabledBorder: InputBorder.none,
                          //     isDense: true,
                          //     filled: true,
                          //     fillColor: Colors.white,
                          //     contentPadding: EdgeInsets.symmetric(
                          //       vertical: 5,
                          //       horizontal: 10,
                          //     ),
                          //   ),
                          // ),
                          CustomDropdown2(
                             
                            items: _DaysOptions,
                            selectedItem: _selectedDays,
                            //placeholder: "Select your division",
                            onChanged: (value) {
                              setState(() {
                                _selectedDays = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                          child: TextField(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
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
                    ),
                ],
              ),
            ],
          ),
        ),
        
      ],
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
          //width: 150,
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
