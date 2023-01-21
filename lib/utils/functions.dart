import 'package:flutter/material.dart';
import 'package:get/get.dart';


// showAlert({required BuildContext context, required String title, required String subTitle}) {
//   return showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//     builder: (BuildContext context) {
//       return AppAlert(
//         title: title,
//         subTitle: subTitle,
//         icon: Iconsax.warning_2,
//         buttonText: "OK",
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       );
//     },
//   );
// }

errorAlert(String error) {
  Get.defaultDialog(
    title: '',
    titlePadding: EdgeInsets.zero,
    content: Column(
      children: [
        const Icon(
          Icons.warning_amber,
          size: 40,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          child: Text(
            error,
            textAlign: TextAlign.center,
            // style: AppTextStyle.mediumBlack14,
          ),
        ),
      ],
    ),
  );
}




Route createRoute({required Widget page}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        // opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}
