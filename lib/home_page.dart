import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DormDetails.dart';
import 'package:flutter_application_1/dorm_data.dart';
import 'package:flutter_application_1/dorm_list.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/profile_page.dart';


class HomePage extends StatefulWidget {
  final void Function()? onTap;
  
  const HomePage({Key? key, this.onTap}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage(BuildContext context) {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

   List dormList = [
    Dorm(name: "Budget Budget",
    price: "1500 per person",
    imagePath: "lib/images/a1.jpeg"  ,
    imagePath1: "lib/images/a2.jpeg",
    imagePath2: "lib/images/a3.jpeg",
    imagePath3: "lib/images/a4.jpeg",
    imagePath4: "lib/images/a5.jpeg",
    details: "Standard fan room.",
    details2: "Cupboard/ Study Space/ Single bed/ 3 min drive to university ",),


    Dorm(name: "AeroSpace",
    price: "2500",
    imagePath: "lib/images/b1.jpeg"  ,
    imagePath1: "lib/images/b2.webp",
    imagePath2: "lib/images/b3.webp",
    imagePath3: "lib/images/b4.webp",
    imagePath4: "lib/images/b5.webp",
    details: "Standard fan room.",
    details2: "Have big parking/ Cupboard/ Standard fan/ Queen bed",),

    Dorm(name: "Live Together",
    price: "1500 per person",
    imagePath: "lib/images/d1.jpeg"  ,
    imagePath1: "lib/images/d2.jpeg",
    imagePath2: "lib/images/d3.webp",
    imagePath3: "lib/images/d4.jpeg",
    imagePath4: "lib/images/d5.jpeg",
    details: "Group Dormitory",
    details2: "Near University/ Air conditioner/ Public refrigerator/ Public rest room",),

    Dorm(name: "NZ Resort",
    price: "4000",
    imagePath: "lib/images/e1.jpg"  ,
    imagePath1: "lib/images/e2.jpg",
    imagePath2: "lib/images/e3.jpg",
    imagePath3: "lib/images/e4.jpg",
    imagePath4: "lib/images/e5.jpg",
    details: "Near University",
    details2: "Study Space/ Air-Conditioner/ Refrigerator/ Elevator",),

    Dorm(name: "MK Resort",
    price: "3500",
    imagePath: "lib/images/f1.jpg"  ,
    imagePath1: "lib/images/f2.jpg",
    imagePath2: "lib/images/f3.jpg",
    imagePath3: "lib/images/f4.jpg",
    imagePath4: "lib/images/f5.jpg",
    details: "Clean and quiet environment.",
    details2: "Have big parking/ Air-conditioner/ Refrigerator/ Swimming pool",),

    Dorm(name: "Ban Phutawan View",
    price: "3000",
    imagePath: "lib/images/g2.jpg"  ,
    imagePath1: "lib/images/g1.jpg",
    imagePath2: "lib/images/g3.jpg",
    imagePath3: "lib/images/g4.jpg",
    imagePath4: "lib/images/g5.jpg",
    details: "Clean and quiet environment.",
    details2: "Near Market/ Air-Conditioner/ Refrigerator",),

    Dorm(name: "New Home",
    price: "4500",
    imagePath: "lib/images/h1.jpg"  ,
    imagePath1: "lib/images/h2.jpg",
    imagePath2: "lib/images/h3.jpg",
    imagePath3: "lib/images/h4.jpg",
    imagePath4: "lib/images/h5.jpg",
    details: "Clean and quiet environment.",
    details2: "Have big parking/ Air-conditioner/ Refrigerator/ TV/ Study Space ",),

    Dorm(name: "Superior house",
    price: "20000",
    imagePath: "lib/images/c1.jpeg"  ,
    imagePath1: "lib/images/c2.jpeg",
    imagePath2: "lib/images/c3.jpeg",
    imagePath3: "lib/images/c4.jpeg",
    imagePath4: "lib/images/c5.jpeg", 
    details: "Clean and quiet environment.",
    details2: "Have large space for parking/ 3 master bedrooms/ Luxuary Type",),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DormHub"),
        backgroundColor: Theme.of(context).colorScheme.background,
        // Add your app bar contents here
        // For example, title, actions, etc.
      ),
      drawer: MyDrawer(
        onProfileTap: () => goToProfilePage(context),
        onSignOut: signUserOut,
      ),
      body: ListView.builder(
  itemCount: dormList.length,
  itemBuilder: (context, index) {
    return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DormDetails(dorm: dormList[index]),
      ),
    );
  },
  child: dorm_list(
    dorm: dormList[index],
            ),
          );
        },
      ),
    );
  }
}
