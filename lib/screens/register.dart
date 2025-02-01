import 'package:flutter/material.dart';

class AppRegisterPage extends StatefulWidget {
  const AppRegisterPage({super.key});

  @override
  State<AppRegisterPage> createState() => _AppRegisterPageState();
}

class _AppRegisterPageState extends State<AppRegisterPage> {
  bool _isPasswordVisible = false;
  final _signFormKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Account"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _signFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset("assets/images/sign_up.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Sign Up",
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "User Name",
                    hintText: "Samuel",
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (_confirmPasswordController) {
                    if (_confirmPasswordController!.length < 6) {
                      return "Password lengith must be at least 6 characters";
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  obscureText: _isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
                padding: const EdgeInsets.only(top: 4, left: 50, right: 50),
                child: ElevatedButton(
                  onPressed: () {
                    if (_signFormKey.currentState!.validate()) {
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");
                    }
                  },
                  child: Text("Submit",
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
            ],
          ),
        ),
      ),
    );
  }
}
