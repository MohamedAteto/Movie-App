import 'package:flutter/material.dart';

class SeetItem extends StatelessWidget {
  final String seatNumber;
  final String status;
  final VoidCallback onTap;

  SeetItem({
    super.key,
    required this.seatNumber,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final seatColor = status == "Available"
        ? const Color(0xFFB7791F)
        : const Color(0xFF78909C);

    return Material(
      color: seatColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.white24,
        onTap: onTap,
        child: Center(
          child: Text(
            seatNumber,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
