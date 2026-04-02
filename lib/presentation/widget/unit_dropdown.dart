import 'package:flutter/material.dart';

class UnitDropdown extends StatelessWidget {
  const UnitDropdown({
    super.key,
    required this.label,
    required this.selectedUnit,
    required this.units,
    required this.onChanged,
  });

  final String label;
  final String selectedUnit;
  final List<String> units;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedUnit,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12
        ),
      ),
      items: units.map(
              (unit) => DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit)
              ),
      ).toList(),
      onChanged: onChanged,
    );
  }
}
