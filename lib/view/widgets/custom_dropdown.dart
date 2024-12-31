import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  final String labelText;
  final bool isRequired;
  final String placeholder;

  const CustomDropdown({
    super.key,
    this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    required this.labelText,
    this.isRequired = false,
    this.placeholder = "Select an option",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 1),
        SizedBox(
          height: 30,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
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
