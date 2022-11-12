import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/provider/home_provider.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_detail.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page_scroll.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_screen.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/search/search_screen.dart';
import 'package:saffron_hub/view/setting/setting_screen.dart';
import 'package:saffron_hub/view/splash/splash_screen.dart';
import 'package:saffron_hub/view/vendors/vendors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: HomeProvider()),
            ChangeNotifierProvider.value(value: FoodVendorsProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SaffronHub',
            theme: ThemeData(
              // fontFamily: kRegular,
              primarySwatch: appColor, // Colors.blue,
              canvasColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // home: const SplashScreen(),
            initialRoute: SplashScreen.id,
            routes: {
              SplashScreen.id: (context) => SplashScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              VendorsScreen.id: (context) => VendorsScreen(
                  // image: HomeProvider().restaurantsListModel![0].vendorProfilePic,
                  // name: HomeProvider().restaurantsListModel![0].name,
                  // phoneNo: HomeProvider().restaurantsListModel![0].phone,
                  // location: HomeProvider().restaurantsListModel![0].location,
                  ),
              SearchScreen.id: (context) => SearchScreen(),
              AccountSettingScreen.id: (context) => AccountSettingScreen(),
              FoodVendorScreen.id: (context) => FoodVendorScreen(),
              FoodVendorDetailScreen.id: (context) => FoodVendorDetailScreen(),
              // CustomScrollViewScreen.id: (context) => CustomScrollViewScreen(),
              // Popo.id: (context) => Popo(),
            },
          ),
        );
      },
    );
  }
}
