import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gotilo_job/View/SplashScreen/splash_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gotilo Job',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.TxtOrangeColor,
        textTheme:
            GoogleFonts.poppinsTextTheme(), // Set Poppins as the default font
      ),
      home: SplashScreen(),
    );
  }
}
