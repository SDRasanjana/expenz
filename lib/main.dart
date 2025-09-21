import 'package:flutter/material.dart';
import 'package:expenz/services/user_details_service.dart';
import 'package:expenz/widgets/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkUsername(),
      builder: (context, snapshot) {
        // if the snapshot is still waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          //here the hasUsername will be set to true of the data is there in the snapshot else it will be false
          bool hasUsername = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Expenz',
            theme: ThemeData(fontFamily: 'Inter'),
            home: Wrapper(showMainScreen: hasUsername),
          );
        }
      },
    );
  }
}
