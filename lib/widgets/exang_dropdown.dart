import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/exang.dart';

class ExangDropdown extends StatefulWidget {
  final Function(int) onExangSelected;

  ExangDropdown({required this.onExangSelected});

  @override
  _ExangDropdownState createState() => _ExangDropdownState();
}

class _ExangDropdownState extends State<ExangDropdown> {
  ExangType? _selectedExang;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<ExangType>(
        hint: Text("Exercise induced angina?"),
        value: _selectedExang,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (ExangType? newValue) {
          setState(() {
            _selectedExang = newValue;
          });

          int ExangValue = _getExangValue(newValue);
          widget.onExangSelected(
              ExangValue); // Call the callback with the selected Exang value
        },
        items: ExangType.values.map((ExangType Exang) {
          return DropdownMenuItem<ExangType>(
            value: Exang,
            child: Text(_getExangText(Exang)),
          );
        }).toList(),
      ),
    );
  }

  int _getExangValue(ExangType? Exang) {
    switch (Exang) {
      case ExangType.YES:
        return 1;
      case ExangType.NO:
        return 0;
      default:
        return -1;
    }
  }

  String _getExangText(ExangType Exang) {
    switch (Exang) {
      case ExangType.YES:
        return 'Yes';
      case ExangType.NO:
        return 'No';
    }
  }
}
