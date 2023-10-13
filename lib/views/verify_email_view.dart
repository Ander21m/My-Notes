
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

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
          TextButton(onPressed: () {
            
           context.read<AuthBloc>().add(const AuthEventSendEmailVerification());
          }, 
          child: const Text("Send email verification")),
          TextButton(onPressed: (){
            context.read<AuthBloc>().add(const AuthEventLogOut());
          },
          child: const Text("Restart"),) 
        ],),
    );
        
      
  }
}