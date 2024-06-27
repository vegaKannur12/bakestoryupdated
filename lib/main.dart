import 'dart:io';
import 'package:bakestorynew/screens/REPORTS/daily_prod.dart';
import 'package:bakestorynew/screens/REPORTS/damage_prod.dart';
import 'package:bakestorynew/screens/REPORTS/employee.dart';
import 'package:bakestorynew/screens/REPORTS/m_damage.dart';
import 'package:bakestorynew/screens/REPORTS/m_report.dart';
import 'package:bakestorynew/screens/REPORTS/monthlyPro.dart';
import 'package:bakestorynew/screens/splashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bakestorynew/PROVIDER/providerDemo.dart';
import 'package:bakestorynew/components/commonColor.dart';
import 'package:bakestorynew/controller/controller.dart';
import 'package:bakestorynew/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_year_picker2/month_year_picker2.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
// import 'package:month_year_picker/month_year_picker.dart';
void requestPermission() async {
  var sta = await Permission.storage.request();
  var status = Platform.isIOS
      ? await Permission.photos.request()
      : await Permission.manageExternalStorage.request();
  if (status.isGranted) {
    await Permission.manageExternalStorage.request();
  } else if (status.isDenied) {
    await Permission.manageExternalStorage.request();
  } else if (status.isRestricted) {
    await Permission.manageExternalStorage.request();
  } else if (status.isPermanentlyDenied) {
    await Permission.manageExternalStorage.request();
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  requestPermission();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
      ChangeNotifierProvider(create: (context) => ProviderDemo())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //  static const routeName = '/mainscreen';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // String? formattedDate = ModalRoute.of(context)!.settings.arguments.toString();
    return MaterialApp(
      theme: ThemeData(
        primaryColor: P_Settings.purple,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbColor: const MaterialStatePropertyAll(Colors.black45),
            minThumbLength: 0.1),
      ),
      debugShowCheckedModeBanner: false,
      home:
          // MyApp(),
          // EmployReport(),
          // MonthlyPro(),
          // MonthlyDamage(),
          //  DamageProd(),
          // DailyProduct(),
          const SplashScreen(),
          // RegisterScreen(),
          // Report(),
      //  const HomeScreen(),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'GB'),
      ],
    );
  }
}
    