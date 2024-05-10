import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';


class SucceesPage extends StatelessWidget {
  const SucceesPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text("Payment Success"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              "Payment Successful!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page or perform any other action
                 Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=>const HomePage()),);
              },
              child: Text("Back To Home"),
            ),
          ],
        ),
      ),
    );
  }
}
