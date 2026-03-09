import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff174d3a),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onRemove,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Icon(Icons.remove, size: 18, color: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              quantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          GestureDetector(
            onTap: onAdd,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Icon(Icons.add, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}