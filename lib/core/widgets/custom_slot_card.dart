import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../providers/theme_provider.dart';

class CustomSlotCards {
  static Widget slotCard({
    required String venueName,
    required String venueID,

    String venueImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSgF0ZZellGigY6zud8QSLGC6lS-2lWR3aA&s',
    required String venueLocation,
    double venueRating = 3.78,
    int venueRaters = 96,
    int showPrice = 399,
    required String gameDate,
    required String gameTime,
    required int actualPrice,
    required int asides,
    int teamA = 0,
    int teamB = 0,
    bool bookingStatus = false,
    required Function onBookNowClick, // Adding function to handle onTap action
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQSgF0ZZellGigY6zud8QSLGC6lS-2lWR3aA&s',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$venueName | $venueLocation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19C965),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$asides aside Game • $teamA in Team A • $teamB in Team B ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          
                          TextSpan(
                            text: gameDate,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' - ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: gameTime,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          venueRating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '($venueRaters)',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: ' ₹',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: showPrice.toString(),
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: ' ₹',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: actualPrice.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                          TextSpan(
                            text: ' Book Now ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                onBookNowClick();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
