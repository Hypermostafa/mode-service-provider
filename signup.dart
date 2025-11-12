import 'package:flutter/material.dart';
import 'package:flutter_application_6/providers/accountprovider.dart';
import 'package:flutter_application_6/widgets/textfield.dart';

import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                label: "Name",
                icon: Icons.person,
              ),
              CustomTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: phoneController,
                label: "Phone",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
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
                  await provider.signup(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(provider.acc?.message ?? "No response"),
                    ),
                  );
                },
                child: const Text("Sign Up"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
