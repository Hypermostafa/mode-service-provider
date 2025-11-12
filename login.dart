import 'package:flutter/material.dart';

import 'package:flutter_application_6/providers/accountprovider.dart';
import 'package:flutter_application_6/screens/signup.dart';

import 'package:flutter_application_6/widgets/textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: passwordController,
                label: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await provider.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(provider.acc?.message ?? "No response"),
                    ),
                  );
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: ( context) => SignupScreen()));
                },
                child: const Text("Don’t have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
