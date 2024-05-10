import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment_success_%20page.dart';


class PayWithQR extends StatefulWidget {
  const PayWithQR({super.key});

  @override
  _PayWithQRState createState() => _PayWithQRState();
}

class _PayWithQRState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8ECAE6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/qr.jpg'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SucceesPage(),
                  ),
                );
              },
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




