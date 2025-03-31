import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/button.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool isObscurePass = true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow,
      body:   SafeArea(
            child: Form(

              key: _formKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: 300,
                      child: Lottie.asset('assets/animations/lottie2.json')
                  ),
                  Center(child: Text("Sign Up", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.blue),)),
                  Center(child: Text("Register with Valid Data", style: TextStyle(fontSize: 15,color: Colors.blueAccent),)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.person)
                      ),
                      keyboardType: TextInputType.name,
                      autofillHints: [AutofillHints.name],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email ID",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.email)
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
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
                      text: "Register",
                      onPressed: (){

                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have an Accout?", style: TextStyle(fontSize: 14,color: Colors.blueAccent)),
                        GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("sign in", style: TextStyle(fontSize: 14,color: Colors.pink)),
                            ),
                            onTap: (){
                              // Navigator.pushNamed(context, 'lib/screens/registration_screen.dart');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            }
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
        )
    );
  }
}
