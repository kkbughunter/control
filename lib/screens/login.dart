import 'package:flutter/material.dart';
import 'package:control/screens/register.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({super.key});

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  bool _isPasswordVisible = false;
  final _signFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _signFormKey,
          child: ListView(
            children: [
              SizedBox(
                // height: 200,
                child: Image.asset("assets/images/sign_in.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (_emailController) {
                    if (_emailController!.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "admin@gmail.com",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (_passwordController) {
                    if (_passwordController!.length < 6) {
                      return "Password lengith must be at least 6 characters";
                    }
                    return null;
                  },
                  controller: _passwordController,
                  obscureText: _isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "********",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: () {
                    if (_signFormKey.currentState!.validate()) {
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");
                    }
                  },
                  child: Text("Login",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.blue[900],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppRegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Create Account?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
