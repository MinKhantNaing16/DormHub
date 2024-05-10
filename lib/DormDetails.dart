import 'package:flutter/material.dart';
import 'package:flutter_application_1/dorm_data.dart';
import 'package:flutter_application_1/payment_page.dart';

class DormDetails extends StatelessWidget {
  final Dorm dorm;

  const DormDetails({Key? key, required this.dorm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dorm Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dorm.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Slideshow of images
            Container(
              height: 200, // Adjust the height as needed
              child: PageView(
                children: [
                  Image.asset(dorm.imagePath),
                  Image.asset(dorm.imagePath1),
                  Image.asset(dorm.imagePath2),
                  Image.asset(dorm.imagePath3),
                  Image.asset(dorm.imagePath4),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Price: Baht ${dorm.price}',
              style: TextStyle(fontSize: 20),
            ),
            // SizedBox(height: 10),
            // Text(
            //   'Details: ${dorm.details}',
            //   style: TextStyle(fontSize: 18),
            // ),

            SizedBox(height: 20),
            Text(
              'Facilities:',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 8),
            Text(
              '\t\t\t\t\t\t  ${dorm.details2}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [

                  SizedBox(width: 10), // Add spacing between buttons
                  Divider(height: 20, thickness: 1), // Add divider between buttons
                  //SizedBox(width: 10), // Add spacing between buttons

                  ElevatedButton(
                    onPressed: () {
                      // Add your payment logic here
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                        builder: (context) => Payment(dorm: dorm,),
      ),
    );
                    },
                    child: 
                    Text('Payment'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
