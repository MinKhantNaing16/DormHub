import 'package:flutter_application_1/dorm_data.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class dorm_list extends StatelessWidget {
  final Dorm dorm;
  const dorm_list({super.key, required this.dorm});

  
  @override
Widget build(BuildContext context) {

return SingleChildScrollView( child: 
Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: Container(
    decoration: BoxDecoration(
      color:  Color(0xFF8ECAE6),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3, // Set width to 30% of screen width
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                dorm.imagePath,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Add some space between image and text
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dorm.name,
                style: GoogleFonts.dmSerifDisplay(fontSize: 22),
              ),
              Text(
                'Price: \$' + dorm.price,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                dorm.details,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)
);

}
}

