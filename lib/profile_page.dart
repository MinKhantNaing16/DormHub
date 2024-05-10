import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_box.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  //all users
  final usersCollection = FirebaseFirestore.instance.collection("users");

    File? _pickedImage;

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _pickedImage = File(pickedFile.path);
  //     });
  //   }
  // }

  // Future<void> _uploadImage() async {
  //   if (_pickedImage == null) return;

  //   try {
  //     final Reference ref = FirebaseStorage.instance.ref().child('images').child('image.jpg');
  //     await ref.putFile(_pickedImage!);
  //     final imageUrl = await ref.getDownloadURL();
  //     // Do something with the download URL (e.g., save it to Firestore)
  //     print('Image uploaded successfully: $imageUrl');
  //   } catch (error) {
  //     print('Error uploading image: $error');
  //   }
  // }

bool _isImagePickerActive = false;

Future<void> _pickImageAndUpload() async {
  if (_isImagePickerActive || !mounted) return; // Check if image picker is active or widget is disposed
  setState(() {
    _isImagePickerActive = true; // Set flag to indicate image picker is active
  });

  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null && mounted) { // Check if widget is still mounted before updating state
    setState(() {
      _pickedImage = File(pickedFile.path);
    });
    await _uploadImage();
  }

  if (mounted) { // Check if widget is still mounted before updating state
    setState(() {
      _isImagePickerActive = false; // Reset flag after image picker is completed
    });
  }
}



Future<void> _uploadImage() async {
  if (_pickedImage == null) return;

  try {
    final Reference ref = FirebaseStorage.instance.ref().child('profiles').child('profile.jpg');
    await ref.putFile(_pickedImage!);
    final imageUrl = await ref.getDownloadURL();
    print('Image uploaded successfully: $imageUrl');

    // Save the image URL to Firestore
    await usersCollection.doc(currentUser.email).update({'profilePhotoUrl': imageUrl});

  } catch (error) {
    print('Error uploading image: $error');
    // Handle error gracefully
  }
}



  Future<void> editField(String field) async{
    String newValue = "";
    await showDialog(
      context: context,
       builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Edit $field",
        style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),

          ),
          onChanged: (value){
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: Text('Cancel',
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

           TextButton(
            child: Text('Save',
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
           ),
        ],
       )
       );

       //update in firestore
       if(newValue.trim().length >0){
        // only update if there is something in the textfield
        await usersCollection.doc(currentUser.email).update({field: newValue});
       }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFF8ECAE6),
    appBar: AppBar(
      title: Text("Profile Page"),
      backgroundColor: Colors.white,
      
    ),
    body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("users").doc(currentUser.email).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
            children: [
              const SizedBox(height: 50),
             GestureDetector(
  onTap: _pickImageAndUpload, // Tap to pick and upload image
  child: CircleAvatar(
    radius: 36,
    backgroundImage: _pickedImage != null
        ? FileImage(_pickedImage!)
        : userData['profilePhotoUrl'] != null
            ? NetworkImage(userData['profilePhotoUrl'])
            : AssetImage('assets/placeholder_image.jpg') as ImageProvider<Object>?,
  ),
),


              const SizedBox(height: 10),
              //user email
              Text(
                currentUser.email!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text('My Details',
                  style: TextStyle(color: Colors.grey[600]),),
              ),
              MyTextBox(
                text: userData['username'],
                sectionName: 'username',
                onPressed: () => editField('username'),
              ),
              MyTextBox(
                text: userData['age'],
                sectionName: 'age',
                onPressed: () => editField('age'),
              ),
              MyTextBox(
                text: userData['country'],
                sectionName: 'country',
                onPressed: () => editField('country'),
              ),
            ],
          );
        } else if (snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
  );
}

}