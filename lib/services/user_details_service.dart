import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //mehtod to store user data in the device storage
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check whether the user entered password and confirm password are same
      if (password != confirmPassword) {
        //show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password and Confirm Password do not match'),
          ),
        );
      }
      //if the users password and conf password are same then store the user details
      // create an instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store the user details in the device storage
      await prefs.setString('userName', userName);
      await prefs.setString('email', email);
      //show a message to the user
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Details Stored Successfully')),
      );
    } catch (err) {
      err.toString();
    }
  }

  //method to check weather the username is saved in the shared pref
  static Future<bool> checkUsername() async {
    //create an instance for shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString('userName');
    return userName != null;
  }

  //method to get the user name from the shared pref
  static Future<Map<String, String>> getUserData() async {
    //create an instance for shared pref
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString('userName');
    String? email = pref.getString('email');
    return {'userName': userName!, 'email': email!};
  }
}
