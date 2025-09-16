import 'package:flutter/material.dart';
import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constant.dart';
import 'package:expenz/widgets/custom_button.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  // for the checkbox
  bool _rememberMe = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //controllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your \nPersonal Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Form field for the user name
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          //check whether entered valid username
                          if (value!.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Form field for the user email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check whether entered valid email
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please Enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      //Form field for the user password
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check whether entered valid password
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      //Form field for the user confirm password
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          //check whether entered valid confirm password
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //Remember me for the next time
                      Row(
                        children: [
                          Text(
                            'Remember Me for the next time',
                            style: TextStyle(fontSize: 16, color: kGrey),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _rememberMe,
                              activeColor: kMainColor,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //Button to submit the form
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //form is valid, process data
                            String userName = _nameController.text;
                            String userEmail = _emailController.text;
                            String userPassword = _passwordController.text;
                            String userConfirmPassword =
                                _confirmPasswordController.text;
                          }
                        },
                        child: CustomButton(
                          buttonName: 'Next',
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
