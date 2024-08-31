import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/chest_pain_type.dart';

class ChestPainDropdown extends StatefulWidget {
  final Function(int) onChestPainSelected;

  ChestPainDropdown({required this.onChestPainSelected});

  @override
  _ChestPainDropdownState createState() => _ChestPainDropdownState();
}

class _ChestPainDropdownState extends State<ChestPainDropdown> {
  ChestPainType? _selectedChestPain;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<ChestPainType>(
        hint: Text("Select ChestPain"),
        value: _selectedChestPain,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (ChestPainType? newValue) {
          setState(() {
            _selectedChestPain = newValue;
          });

          int ChestPainValue = _getChestPainValue(newValue);
          widget.onChestPainSelected(
              ChestPainValue); // Call the callback with the selected ChestPain value
        },
        items: ChestPainType.values.map((ChestPainType ChestPain) {
          return DropdownMenuItem<ChestPainType>(
            value: ChestPain,
            child: Text(_getChestPainText(ChestPain)),
          );
        }).toList(),
      ),
    );
  }

  int _getChestPainValue(ChestPainType? ChestPain) {
    switch (ChestPain) {
      case ChestPainType.TypicalAngina:
        return 0;
      case ChestPainType.AtypicalAgina:
        return 1;
      case ChestPainType.NonAnginalPain:
        return 2;
      case ChestPainType.Asympotomatic:
        return 3;
      default:
        return -1;
    }
  }

  String _getChestPainText(ChestPainType ChestPain) {
    switch (ChestPain) {
      case ChestPainType.TypicalAngina:
        return 'Typical Angina';
      case ChestPainType.AtypicalAgina:
        return 'Atypical Agina ';
      case ChestPainType.NonAnginalPain:
        return 'Non-anginal Pain ';
      case ChestPainType.Asympotomatic:
        return 'Asymptomatic ';
    }
  }
}
