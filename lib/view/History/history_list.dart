import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_text/text.dart';
import '../../consts/const_colors.dart';
import '../../models/HistoryModel.dart';
class HistoryList extends StatelessWidget {
  final List<HistoryModel>? historyData;
  const HistoryList({Key? key,this.historyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return historyData!.isEmpty
        ? ListView(
      children: const [
        SizedBox(
          height: 250,
        ),
        Center(child: Text("Nothing Found",style: TextStyle(color: kYellow,fontSize: 20,fontWeight:FontWeight.w600),),),
      ],
    )
        : ListView.builder(
        itemCount: historyData?.length??0,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 70.w,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child:historyData![index].orderDetails!.length>=1?CachedNetworkImage(
                              imageUrl:historyData?[index].orderDetails!.first.productImage??"",
                              errorWidget: (context, url, error) =>
                                  Container(height: 100.h,
                                    width: 70.w,
                                    color: Colors.grey,
                                  ),
                              fit: BoxFit.fill,
                            ):
                            Container(height: 100.h,
                              width: 70.w,
                              color: Colors.grey,
                            ),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 24.h,
                                width: 150.w,
                                child:  CustomText(
                                  text:historyData![index].customerName??"" ,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text:"Total Bill",
                              fontSize: 14,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                                height: 17.h,
                                width: 150.w,
                                child: CustomText(
                                  text:historyData![index].totalBill??"",
                                  fontSize: 14,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Row(
                          children: [
                           Icon(Icons.location_on_outlined),                           SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                                height: 17.h,
                                width: 150.w,
                                child: CustomText(
                                  text:historyData![index].deliveryAddress??"",
                                  fontSize: 14,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
