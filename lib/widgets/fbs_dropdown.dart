import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/fbs_type.dart';

class FbsDropdown extends StatefulWidget {
  final Function(int) onFbsSelected;

  FbsDropdown({required this.onFbsSelected});

  @override
  _FbsDropdownState createState() => _FbsDropdownState();
}

class _FbsDropdownState extends State<FbsDropdown> {
  FbsType? _selectedFbs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<FbsType>(
        hint: Text("Fasting blood sugar > 120mg.dl?"),
        value: _selectedFbs,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (FbsType? newValue) {
          setState(() {
            _selectedFbs = newValue;
          });

          int FbsValue = _getFbsValue(newValue);
          widget.onFbsSelected(
              FbsValue); // Call the callback with the selected Fbs value
        },
        items: FbsType.values.map((FbsType Fbs) {
          return DropdownMenuItem<FbsType>(
            value: Fbs,
            child: Text(_getFbsText(Fbs)),
          );
        }).toList(),
      ),
    );
  }

  int _getFbsValue(FbsType? Fbs) {
    switch (Fbs) {
      case FbsType.TRUE:
        return 1;
      case FbsType.FALSE:
        return 0;
      default:
        return -1;
    }
  }

  String _getFbsText(FbsType Fbs) {
    switch (Fbs) {
      case FbsType.TRUE:
        return 'True';
      case FbsType.FALSE:
        return 'False';
    }
  }
}
