import 'package:campus_assistant/assets.dart';
import 'package:campus_assistant/extensions.dart';
import 'package:campus_assistant/features/indoor_navigation/models/indoor_location_vertex.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDropdown extends StatelessWidget {
  final String hint;
  final List<IndoorLocationVertex> locations;
  final IndoorLocationVertex? selectedLocation;
  final ValueChanged<IndoorLocationVertex?> onChanged;

  const LocationDropdown({
    super.key,
    required this.hint,
    required this.locations,
    required this.selectedLocation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: context.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 16,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: DropdownButton<IndoorLocationVertex>(
          value: selectedLocation,
          hint: Text(
            hint,
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 22,
              fontFamily: GoogleFonts.redHatDisplay().fontFamily,
            ),
          ),
          style: TextStyle(
            color: const Color(0xFF666666),
            fontSize: 22,
            fontFamily: GoogleFonts.redHatDisplay().fontFamily,
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(Assets.downArrow, scale: 3),
          ),
          iconSize: 24,
          onChanged: onChanged,
          items: _createItems(),
        ),
      ),
    );
  }

  List<DropdownMenuItem<IndoorLocationVertex>> _createItems() {
    return locations.map<DropdownMenuItem<IndoorLocationVertex>>((
      IndoorLocationVertex location,
    ) {
      return DropdownMenuItem<IndoorLocationVertex>(
        value: location,
        child: Text(location.name),
      );
    }).toList();
  }
}
