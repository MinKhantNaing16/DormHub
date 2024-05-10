import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment_success_%20page.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class PayWithCard extends StatefulWidget {
  const PayWithCard({super.key});

  @override
  State<PayWithCard> createState() => _PayWithQRState();
}

class _PayWithQRState extends State<PayWithCard> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTapped(){
    if(formKey.currentState!.validate()){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name $cardHolderName"),
                Text("CVV $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancel")
              ),

              TextButton(
                onPressed:()=> Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> SucceesPage())), 
                child: const Text("Yes"))
          ],
        )
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text ("Payment"),
      ),
      body:  Column(
        children: [
          Flexible(
            flex: 20 ,
            child: 
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0){},
            )),

           
            CreditCardForm(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              onCreditCardModelChange: (data){
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              }, 
              formKey: formKey),

              const Spacer(),

           ElevatedButton(
            onPressed: userTapped, 
            child: const Text("Pay Now")
            ),
              const SizedBox(height: 25)
        ],
      ),
    );
  }
}