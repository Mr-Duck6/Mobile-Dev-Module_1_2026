import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {

  final double rating;

  final String? label;

  const RatingBadge({
    super.key,
    required this.rating,
    this.label,
  });

  Color _getStarColor(BuildContext context) {
    if (rating >= 4.0) {
      return Colors.green;
    } else if (rating >= 2.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final starColor = _getStarColor(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: starColor,
          size: 24.0,
        ),
        const SizedBox(width: 6.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (label != null) ...[
              const SizedBox(height: 2.0),
              Text(
                label!,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}