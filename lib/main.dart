import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/pages/phone_confirmation_page.dart';
import 'package:freshcode_loyalty_t3/authentication/presentation/pages/phone_verification_page.dart';
import 'authentication/presentation/pages/auth_checker.dart';
import 'locales.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      supportedLocales: locales,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      builder: (context, _) {
        var child = _!;
        final navigatorKey = child.key as GlobalKey<NavigatorState>;

        // initializing a Toast and passing it in the FlashTheme
        child = Toast(child: child, navigatorKey: navigatorKey);
        child = FlashTheme(
          child: child,
          flashDialogTheme: const FlashDialogThemeData(),
        );
        return child;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
          headline2: TextStyle(
              fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w700),
          bodyText1: TextStyle(
              fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(213, 241, 225, 1)),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(213, 241, 225, 1),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
        ),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthChecker(),
        '/verify_phone': (context) => const PhoneVerificationPage(),
        '/confirm_phone': (context) => const PhoneConfirmationPage()
      },
    );
  }
}


