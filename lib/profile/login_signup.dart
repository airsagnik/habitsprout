import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/auth_manager.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true; // Toggle between Login and Sign-Up

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> showLoader = ValueNotifier<bool>(false);

  Future<void> onSubmit(Authentication auth) async {
    if (_formKey.currentState?.validate() ?? false) {
      showLoader.value = true;
      try {
        if (isLogin) {
          await auth.login(emailController.text, passwordController.text);
        } else {
          await auth.signUp(emailController.text, passwordController.text);
        }
      } catch (error) {
        throw Exception();
      } finally {
        showLoader.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo or Title
                  Text(
                    isLogin ? "Welcome Back!" : "Create Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isLogin ? "Login to continue" : "Sign up to get started",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 32),
                  // Email TextField
                  TextFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'email should not be empty';
                      }
                      if (!val.contains("@")) {
                        return 'not valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  // Password TextField
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: isLogin ? 16 : 16),
                  // Confirm Password TextField (for Sign-Up)
                  if (!isLogin)
                    TextFormField(
                      validator: (val) {
                        if (isLogin) {
                          return null;
                        }
                        if (val == null) {
                          return 'confirm password cannot be empty';
                        }

                        if (val != passwordController.text) {
                          return 'does not match with password';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                  SizedBox(height: 32),
                  // Login or Sign-Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Login or Sign-Up
                        final auth =
                            Provider.of<Authentication>(context, listen: false);
                        onSubmit(auth);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isLogin ? "Login" : "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Toggle Between Login and Sign-Up
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Login",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: showLoader,
                    builder: (context, data, child) => data
                        ? SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
