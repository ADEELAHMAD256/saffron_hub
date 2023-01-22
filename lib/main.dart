import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/consts/const_colors.dart';
import 'package:saffron_hub/provider/cart_provider.dart';
import 'package:saffron_hub/provider/food_vendors_provider.dart';
import 'package:saffron_hub/provider/get_product.dart';
import 'package:saffron_hub/provider/get_product_cart_provider.dart';
import 'package:saffron_hub/provider/home_provider.dart';
import 'package:saffron_hub/provider/sign_up_controller.dart';
import 'package:saffron_hub/view/cart/cart_screen.dart';
import 'package:saffron_hub/view/cart/cart_verify.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_detail.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_page_scroll.dart';
import 'package:saffron_hub/view/food_vendor/food_vendor_screen.dart';
import 'package:saffron_hub/view/get_product/get_product_screen.dart';
import 'package:saffron_hub/view/home/home_screen.dart';
import 'package:saffron_hub/view/search/search_screen.dart';
import 'package:saffron_hub/view/send_email_screen/email_screen.dart';
import 'package:saffron_hub/view/setting/setting_screen.dart';
import 'package:saffron_hub/view/sign_in/sign_in_screen.dart';
import 'package:saffron_hub/view/sign_up/sign_up_screen.dart';
import 'package:saffron_hub/view/splash/splash_screen.dart';
import 'package:saffron_hub/view/vendors/vendors_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            ChangeNotifierProvider.value(value: CartProvider()),
            ChangeNotifierProvider.value(value: SignUpController()),
            ChangeNotifierProvider.value(value: GetProductCartProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Saffron Hub',
            theme: ThemeData(
              // fontFamily: kRegular,
              primarySwatch: appColor, // Colors.blue,
              canvasColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home:
                // GetProductScreen(),
                // SignUpScreen(),
                SignInScreen(),
            // initialRoute: SplashScreen.id,
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
              SendEmailScreen.id: (context) => SendEmailScreen(),
              AddToCartScreen.id: (context) => AddToCartScreen(),
              // CustomScrollViewScreen.id: (context) => CustomScrollViewScreen(),
              // Popo.id: (context) => Popo(),
            },
          ),
        );
      },
    );
  }
}
