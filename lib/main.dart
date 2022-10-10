import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mulit_ven/provider/theme_provider.dart';
import 'package:mulit_ven/theme/dark_theme.dart';
import 'package:mulit_ven/theme/light_theme.dart';
import 'package:mulit_ven/utill/app_constants.dart';
import 'package:mulit_ven/view/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await di.init();
  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  int _orderID = 0;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   _orderID = ((notificationAppLaunchDetails!.payload != null &&
  //           notificationAppLaunchDetails.payload!.isNotEmpty)
  //       ? int.parse(notificationAppLaunchDetails.payload)
  //       : null)!;
  // }
  // await MyNotification.initialize(flutterLocalNotificationsPlugin);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ],
    child: MyApp(orderId: _orderID),
  ));
}

class MyApp extends StatelessWidget {
  final int orderId;
  MyApp({required this.orderId});

  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    // AppConstants.languages.forEach((language) {
    //   _locals.add(Locale(language.languageCode, language.countryCode));
    // });
    return MaterialApp(
        title: AppConstants.APP_NAME,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
        // locale: Provider.of<LocalizationProvider>(context).locale,
        // localizationsDelegates: [
        //   AppLocalization.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   FallbackLocalizationDelegate()
        // ],
        // supportedLocales: _locals,
        home:
            //  orderId == null
            // ?
            SplashScreen()
        // : OrderDetailsScreen(
        //     orderModel: null,
        //     orderId: orderId,
        //     orderType: 'default_type',
        //   ),
        );
  }
}
