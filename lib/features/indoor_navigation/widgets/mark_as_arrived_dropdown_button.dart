import 'package:flutter/material.dart';

class MarkAsArrivedPopupMenuButton extends StatelessWidget {
  final VoidCallback onTap;

  const MarkAsArrivedPopupMenuButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Varıldı olarak işaretle',
          child: Text('Varıldı olarak işaretle'),
        ),
      ],
      onSelected: (_) => onTap(),
    );
  }
}
