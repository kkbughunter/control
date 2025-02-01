import 'package:control/authmanagement/auth_manage.dart';
import 'package:control/screens/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:control/screens/register.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({super.key});

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  bool _isPasswordVisible = true;
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
                  onPressed: () async {
                    if (_signFormKey.currentState!.validate()) {
                      try {
                        await AuthManage().login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login successful")),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Invalid credentials Email ID or password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        );
                      }
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppForgetPasswordPage(),
                          ),
                        );
                      },
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
