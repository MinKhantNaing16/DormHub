
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/my_button.dart';
import 'package:flutter_application_1/my_textfield.dart';



class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final NameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ageController = TextEditingController();
  final countryController = TextEditingController();

    @override
  void dispose() {
    NameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    ageController.dispose();
    countryController.dispose();
    super.dispose();
  }

  // Future addUserDetails(String email, int age, String country) async{
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'email':email,
  //     'age': age,
  //     'country':country,
  //   });
  // }
  // sign user in method
  Future<void> signUserUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        
          child: CircularProgressIndicator(),
        ),
      
    );


     try{
      if(passwordController.text == confirmPasswordController.text){
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      

      
      FirebaseFirestore.instance
      .collection("users")
      .doc(userCredential.user!.email)
      .set({
        'username' : NameController.text,
        // 'username' : emailController.text.split('@')[0],
        'age': ageController.text,
        'country' : countryController.text
      });

      }
      else{
        showErrorMessage("Passwords don't match");
      }
      Navigator.pop(context);
    }
    on FirebaseAuthException catch(e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
    
  }

   void showErrorMessage(String message) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8ECAE6),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20),
            
                // logo
                const Icon(
                  Icons.home,
                  size: 50,
                ),
            
                const SizedBox(height: 20),
            
                // welcome back, you've been missed!
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
            
                // username textfield
                MyTextField(
                  controller: NameController,
                  hintText: 'Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //age textfield
                  MyTextField(
                  controller: ageController,
                  hintText: 'age',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //age textfield
                  MyTextField(
                  controller: countryController,
                  hintText: 'Country',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
            
                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                //confirm password
               MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'confirm Password',
                  obscureText: true,
                ),
              
              
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),
            
                // const SizedBox(height: 30),
            
                // // or continue with
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Text(
                //           'Or continue with',
                //           style: TextStyle(color: Colors.grey[700]),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
            
                // const SizedBox(height: 20),
            
                // // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     // google button
                //     SquareTile(imagePath: 'lib/images/google.png'),
            
                //     SizedBox(width: 25),
            
                //     // apple button
                //     SquareTile(imagePath: 'lib/images/apple.png')
                //   ],
                // ),
            
                // const SizedBox(height: 50),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}