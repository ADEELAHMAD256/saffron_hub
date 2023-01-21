import 'package:flutter/material.dart';
import 'package:get/get.dart';
showAlert(String error) {
    Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 200,
        child: Text(
          error,
          textAlign: TextAlign.center,
          // style: AppTextStyle.mediumBlack14,
        ),
      ),
    );
  }
