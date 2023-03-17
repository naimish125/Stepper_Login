import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Stepper_Provider.dart';


class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  Home? HomeTrue, HomeFlse;

  @override
  Widget build(BuildContext context) {
    HomeTrue = Provider.of<Home>(context, listen: true);
    HomeFlse = Provider.of<Home>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Stepper App"),backgroundColor: Colors.red),
        body: Theme(
          data: ThemeData(
            primarySwatch: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.red),
          ),
          child: Stepper(
            type: StepperType.vertical,
            onStepTapped: (index) {
              HomeFlse!.i7(index);
            },
           steps: [
            Step(
            isActive: true,
            title: Text("Sign Up"),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: UnderlineInputBorder(),
                  ),
                ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email id",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: UnderlineInputBorder(),
                ),
              ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
            ),
             Step(
                 isActive: true,
                 title: Text("Login"),
                 content: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextField(
                       decoration: InputDecoration(
                         hintText: "User Name",
                         prefixIcon: Icon(Icons.person_outline),
                         border: UnderlineInputBorder(),
                       ),
                     ),
                     TextField(
                       decoration: InputDecoration(
                         hintText: "Password",
                         prefixIcon: Icon(Icons.lock_outline_rounded),
                         border: UnderlineInputBorder(),
                       ),
                     ),
                   ],
                 ),
             ) ,
             Step(
               isActive: true,
               title: Text("Home"),
               content: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Login Successfully",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold)),
                 ],
               ),
             ),
           ],
            currentStep: HomeTrue!.i,
            onStepCancel: () {
              HomeFlse!.Backstep();
            },
            onStepContinue: () {
              HomeFlse!.Nextstep();
            },
          ),
        ),
      ),
    );
  }
}
