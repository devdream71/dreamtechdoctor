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
    Key? key,
    this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    required this.labelText,
    this.isRequired = false,
    this.placeholder = "Select an option",
  }) : super(key: key);

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
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
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
      ],
    );
  }
}
