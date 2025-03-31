import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pokepedia/screens/registration_screen.dart';

import '../widgets/button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isObscurePass = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.yellow,
      body: SafeArea(
          child: Form(

            key: _formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
                    children: [
            Container(
              height: 200,
              width: 300,
                child: Lottie.asset('assets/animations/lottie1.json')
            ),
                      Center(child: Text("Sign In", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.blue),)),
                      Center(child: Text("Enter Valid UserName and Password", style: TextStyle(fontSize: 15,color: Colors.blueAccent),)),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email/UserName",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.email)
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          obscureText: isObscurePass,

                          decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              child: Icon(Icons.visibility,color: Colors.grey[700],),
                              onTap:(){


                                  setState(() {
                                    if(isObscurePass){
                                      isObscurePass = false;
                                    }else{
                                      isObscurePass = true;
                                    }                                  }
                                );


                              },
                            ),
                          ),
                          // obscureText: true,

                          controller: passwordController,
                          autofillHints: [AutofillHints.password],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 110),
                      //   child: Container(
                      //     width: double.maxFinite,
                      //     height: 50,
                      //     color: Colors.blue[400],
                      //     child: Center(child: Text("Log In", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow),)),
                      //   ),
                      // )
                      Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: ButtonImageFb1(
                        text: "Log In",
                          onPressed: (){
                          print("Log IN");
                          loginUser();
                        },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have any Accout?", style: TextStyle(fontSize: 14,color: Colors.blueAccent)),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("sign up", style: TextStyle(fontSize: 14,color: Colors.pink)),
                              ),
                              onTap: (){
                                // Navigator.pushNamed(context, 'lib/screens/registration_screen.dart');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                                );
                              }
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
          )
      ),

    );
  }

  void loginUser(){
    if(passwordController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please Enter Password",backgroundColor: Colors.red);


    }
    else if(emailController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please Enter Email",backgroundColor: Colors.red);
    }
    else{
      String email = emailController.text;
      String password = passwordController.text;
      print("Email: $email");
      print("Password: $password");
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }).catchError((e){
        Fluttertoast.showToast(msg:"$e",backgroundColor: Colors.red);
      });
    }
  }
}
