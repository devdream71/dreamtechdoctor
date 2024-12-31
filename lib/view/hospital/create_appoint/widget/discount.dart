import 'package:flutter/material.dart';

class DiscountForm extends StatelessWidget {
  const DiscountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal:  4.0, vertical: 4.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          width: 300,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discount",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Fee",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Amount",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "%",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Reference",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Narration",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Handle OK action here
              //     },
              //     child: const Text("Ok"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}