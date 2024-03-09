import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metermate/pages/add_employee.dart';
import 'package:metermate/pages/bill_history_page.dart';
import 'package:metermate/pages/bill_page.dart';
import 'package:metermate/pages/calendar_page.dart';
import 'package:metermate/pages/outage_map_page.dart';
import 'package:metermate/pages/pay_now_page.dart';
import 'package:metermate/pages/qr_code_page.dart';
import 'package:metermate/pages/qr_generator_page.dart';
import 'package:metermate/services/firebase_options.dart';
import 'package:metermate/pages/add_account_page.dart';
import 'package:metermate/pages/auth_page.dart';
import 'package:metermate/pages/home_page.dart';
import 'package:metermate/pages/loading_page.dart';
import 'package:metermate/pages/meter_scan_page.dart';
import 'package:metermate/pages/qr_scan_page.dart';

import 'package:metermate/pages/user_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MeterMate());
}

class MeterMate extends StatelessWidget {
  const MeterMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
      routes: {
        //'loginPage': (context) => const LoginPage(),

        'homePage': (context) => const HomePage(),
        'qrScanPage': (context) => const QRscanPage(),
        'userDetails': (context) => const UserDetail(),
        'authPage': (context) => const AuthPage(),
        'addAccountPage': (context) => const AddAccountPage(),
        'meterScanPage': (context) => const MeterScanPage(),
        "qrGeneratorPage": (context) => const GenerateQRpage(),
        'billHistoryPage': (context) => const BillHistoryPage(),
        'billPage': (context) => const BillPage(),
        'payNowPage': (context) => const PayNowPage(),
        'addEmployee': (context) => const AddEmployeePage(),
        'caledarPage': (context) => const CalendarPage(),
        'outageMapPage': (context) => const OutageMapPage(),
        'qrCodePage': (context) => const QRCodePage(
              data: '',
            )
      },
    );
  }
}
