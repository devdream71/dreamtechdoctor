import 'package:dream_tech_doctor/view/hospital/create_appoint/appoint_pdf_view.dart';
import 'package:dream_tech_doctor/view/hospital/create_appoint/summary_view.dart';
import 'package:dream_tech_doctor/view/hospital/create_appoint/view_appoint.dart';
import 'package:dream_tech_doctor/view/hospital/create_appoint/widget/discount.dart';
import 'package:dream_tech_doctor/view/hospital/create_appoint/widget/free.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String? _selectedPayment;

  void _showPaymentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_selectedPayment == 'Discount') ...[
                const DiscountForm(),
              ],
              if (_selectedPayment == 'Free') ...[
                const FreeForm(),
              ],
              // if (_selectedPayment == 'Paid') ...[
              //   const Text(
              //     "Payment: Paid",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ],
              // if (_selectedPayment == 'Unpaid') ...[
              //   const Text(
              //     "Payment: Unpaid",
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ],
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    // Button action here
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Appointment'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(const PatientTableScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Appoint View',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'New Appoint',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: InkWell(
                onTap: () {
                  Get.to(const AppointmentSummaryScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Appoint Summary View',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    const Text('S.L No: 11',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Visit Date: 10/08/2024'),
                    const Text('Department/Category: Cardiologist'),
                    const Text('Doctor: Dr. Md. Jasim Uddin'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            cursorHeight: 14,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              labelText: 'Patient Mobile/Mail',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.check, color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      cursorHeight: 14,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        labelText: 'Patient Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(

                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                              labelText: 'Gender',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              labelText: 'Age',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              labelText: 'Visit Time',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Morning',
                                child: Text('Morning'),
                              ),
                              DropdownMenuItem(
                                value: 'Afternoon',
                                child: Text('Afternoon'),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                        labelText: 'Payment',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Unpaid',
                          child: Text('Unpaid'),
                        ),
                        DropdownMenuItem(
                          value: 'Paid',
                          child: Text('Paid'),
                        ),
                        DropdownMenuItem(
                          value: 'Discount',
                          child: Text('Discount'),
                        ),
                        DropdownMenuItem(
                          value: 'Free',
                          child: Text('Free'),
                        ),
                      ],
                      value: _selectedPayment,
                      onChanged: (value) {
                        setState(() {
                          _selectedPayment = value;
                          if (_selectedPayment != null) {
                            _showPaymentModal(
                                context); 
                          }
                        });
                      },
                    ),

                    // DropdownButtonFormField<String>(
                    //   decoration: const InputDecoration(
                    //     labelText: 'Payment',
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   items: const [
                    //     DropdownMenuItem(
                    //       value: 'Unpaid',
                    //       child: Text('Unpaid'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: 'Paid',
                    //       child: Text('Paid'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: 'Discount',
                    //       child: Text('Discount'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: 'Free',
                    //       child: Text('Free'),
                    //     ),
                    //   ],
                    //   value: _selectedPayment,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedPayment = value;
                    //     });
                    //   },
                    // ),
                    const SizedBox(height: 10),
                    // if (_selectedPayment == 'Discount') ...[
                    //   const DiscountForm(),
                    //   const SizedBox(height: 10),
                    // ],

                    // if (_selectedPayment == 'Free') ...[
                    //   const FreeForm(),
                    //   const SizedBox(height: 10),
                    // ],

                    // if(_selectedPayment =="Paid") ...[
                    //   const Text("Payment: Paid")
                    // ],

                    // if(_selectedPayment =="Unpaid") ...[
                    //   const Text("Payment: unPaid")
                    // ],

                    const SizedBox(height: 10),
                    const TextField(
                      cursorHeight: 14,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        labelText: 'Refarance',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      maxLines: 3,
                      cursorHeight: 14,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          // Button action here
                          Get.to(const AppointPdfView());
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
