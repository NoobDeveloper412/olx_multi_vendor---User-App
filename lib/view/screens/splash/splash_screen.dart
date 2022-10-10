import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mulit_ven/view/screens/splash/widget/splash_painter.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    // bool _firstTime = true;
    // _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if(!_firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       duration: Duration(seconds: isNotConnected ? 6000 : 3),
    //       content: Text(
    //         isNotConnected ? getTranslated('no_connection', context) : getTranslated('connected', context),
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if(!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   _firstTime = false;
    // });

    // _route();
  }

  @override
  void dispose() {
    super.dispose();

    // _onConnectivityChanged.cancel();
  }

  // void _route() {
  //   Provider.of<SplashProvider>(context, listen: false).initConfig(context).then((bool isSuccess) {
  //     if(isSuccess) {
  //       Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
  //       Timer(Duration(seconds: 1), () {
  //         if(Provider.of<SplashProvider>(context, listen: false).configModel.maintenanceMode) {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MaintenanceScreen()));
  //         }else {
  //           if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
  //             Provider.of<AuthProvider>(context, listen: false).updateToken(context);
  //             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreen()));
  //           } else {
  //             if(Provider.of<SplashProvider>(context, listen: false).showIntro()) {
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen(
  //                 indicatorColor: ColorResources.GREY, selectedIndicatorColor: Theme.of(context).primaryColor,
  //               )));
  //             }else {
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
  //             }
  //           }
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body:
            //  Provider.of<SplashProvider>(context).hasConnection ?
            Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Provider.of<ThemeProvider>(context).darkTheme
                  ? Colors.black
                  : ColorResources.getPrimary(context),
              child: CustomPaint(
                painter: SplashPainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Images.cart_image,
                    height: 160.0,
                    fit: BoxFit.scaleDown,
                    width: 160.0,
                    // color: Theme.of(context).cardColor,
                  ),
                  Text(
                    'MULIT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        )
        //  : NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
        );
  }
}
