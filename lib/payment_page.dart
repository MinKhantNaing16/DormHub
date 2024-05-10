

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/dorm_data.dart';
import 'package:flutter_application_1/pay_with_card_page.dart';
import 'package:flutter_application_1/pay_with_qr_page.dart';

class Payment extends StatelessWidget {
  final void Function()? onTap;
  final Dorm dorm;
  
  const Payment({Key? key, required this.dorm, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dorm.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(image: AssetImage(dorm.imagePath)),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Price: Baht ${dorm.price}',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              
              Center(
                child: Text(
                  "Choose Payment type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>const PayWithQR()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3 - 10,
                        child: Image.asset('lib/images/payment.png'),
                      ),
                    ),
                    SizedBox(width: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>const PayWithCard()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3 - 10,
                        child: Image.asset('lib/images/mastercard.webp'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}

