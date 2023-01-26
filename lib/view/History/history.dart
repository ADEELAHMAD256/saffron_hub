import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

     var homecont = Get.put(HomeController());

    @override
    Widget build(BuildContext context) {
      return GetBuilder<HomeController>(
        builder: (cont) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading:IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.arrow_back_ios_new_rounded),),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 41.h),
              child: SizedBox(
                height: 40.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cont.jobsTypes.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        cont.selected = index;
                        cont.update();
                      },
                      child: SizedBox(
                        height: 36.h,
                        width: 150.w,
                        child: Card(
                          color: cont.selected == index
                              ? const Color(0xffF99D1B)
                              : const Color(0xffFFFFFF),
                          elevation: 5,
                          child: Center(
                            child: Text(
                              cont.jobsTypes[index],
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Rubik",
                                color: cont.selected == index
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff222222),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: GetBuilder<HomeController>(builder: (cont) {
                return cont.getScreen();
              })),
        ),
      );
    }
}
