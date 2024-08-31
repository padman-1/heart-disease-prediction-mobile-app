import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/gender.dart';

class GenderDropdown extends StatefulWidget {
  final Function(int) onGenderSelected;

  GenderDropdown({required this.onGenderSelected});

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<Gender>(
        hint: Text("Select Gender"),
        value: _selectedGender,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (Gender? newValue) {
          setState(() {
            _selectedGender = newValue;
          });

          int genderValue = _getGenderValue(newValue);
          widget.onGenderSelected(
              genderValue); // Call the callback with the selected gender value
        },
        items: Gender.values.map((Gender gender) {
          return DropdownMenuItem<Gender>(
            value: gender,
            child: Text(_getGenderText(gender)),
          );
        }).toList(),
      ),
    );
  }

  int _getGenderValue(Gender? gender) {
    switch (gender) {
      case Gender.MALE:
        return 1;
      case Gender.FEMALE:
        return 0;
      default:
        return -1;
    }
  }

  String _getGenderText(Gender gender) {
    switch (gender) {
      case Gender.MALE:
        return 'Male';
      case Gender.FEMALE:
        return 'Female';
    }
  }
}
