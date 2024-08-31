import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/slope_type.dart';

class SlopeDropdown extends StatefulWidget {
  final Function(int) onSlopeSelected;

  SlopeDropdown({required this.onSlopeSelected});

  @override
  _SlopeDropdownState createState() => _SlopeDropdownState();
}

class _SlopeDropdownState extends State<SlopeDropdown> {
  SlopeType? _selectedSlope;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<SlopeType>(
        hint: Text("Select Slope"),
        value: _selectedSlope,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (SlopeType? newValue) {
          setState(() {
            _selectedSlope = newValue;
          });

          int SlopeValue = _getSlopeValue(newValue);
          widget.onSlopeSelected(
              SlopeValue); // Call the callback with the selected Slope value
        },
        items: SlopeType.values.map((SlopeType Slope) {
          return DropdownMenuItem<SlopeType>(
            value: Slope,
            child: Text(_getSlopeText(Slope)),
          );
        }).toList(),
      ),
    );
  }

  int _getSlopeValue(SlopeType? Slope) {
    switch (Slope) {
      case SlopeType.Upsloping:
        return 0;
      case SlopeType.Flat:
        return 1;
      case SlopeType.Downsloping:
        return 2;
      default:
        return -1;
    }
  }

  String _getSlopeText(SlopeType Slope) {
    switch (Slope) {
      case SlopeType.Upsloping:
        return 'Upsloping';
      case SlopeType.Flat:
        return 'Flat';
      case SlopeType.Downsloping:
        return 'Downsloping';
    }
  }
}
