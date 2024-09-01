import 'package:flutter/material.dart';
import 'package:heart_disease_mobile_app/enums/thal_type.dart';

class ThalDropdown extends StatefulWidget {
  final Function(int) onThalSelected;

  ThalDropdown({required this.onThalSelected});

  @override
  _ThalDropdownState createState() => _ThalDropdownState();
}

class _ThalDropdownState extends State<ThalDropdown> {
  ThalType? _selectedThal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButton<ThalType>(
        hint: Text("Select Thal"),
        value: _selectedThal,
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        // style: TextStyle(),
        onChanged: (ThalType? newValue) {
          setState(() {
            _selectedThal = newValue;
          });

          int ThalValue = _getThalValue(newValue);
          widget.onThalSelected(
              ThalValue); // Call the callback with the selected Thal value
        },
        items: ThalType.values.map((ThalType Thal) {
          return DropdownMenuItem<ThalType>(
            value: Thal,
            child: Text(_getThalText(Thal)),
          );
        }).toList(),
      ),
    );
  }

  int _getThalValue(ThalType? Thal) {
    switch (Thal) {
      case ThalType.Normal:
        return 1;
      case ThalType.FixedDefect:
        return 2;
      case ThalType.ReversibleDefect:
        return 3;
      default:
        return -1;
    }
  }

  String _getThalText(ThalType Thal) {
    switch (Thal) {
      case ThalType.Normal:
        return 'Normal';
      case ThalType.FixedDefect:
        return 'Fixed Defect';
      case ThalType.ReversibleDefect:
        return 'Reversible Defect';
    }
  }
}
