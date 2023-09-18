
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifiedEmailView extends StatefulWidget {
  const VerifiedEmailView({super.key});

  @override
  State<VerifiedEmailView> createState() => _VerifiedEmailViewState();
}

class _VerifiedEmailViewState extends State<VerifiedEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Column(children: [
          const Text("We've send you an emial verification.Please open it to verify your account."),
          const Text("If you haven't recieve a verification email yet,press the button below."),
          TextButton(onPressed: () async{
            
            await AuthService.firebase().sendEmailVerification();
          }, 
          child: const Text("Send email verification")),
          TextButton(onPressed: ()async{
            await AuthService.firebase().logOut();
            Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
          },
          child: const Text("Restart"),) 
        ],),
    );
        
      
  }
}