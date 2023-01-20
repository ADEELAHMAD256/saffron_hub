import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:saffron_hub/components/custom_card/custom_card.dart';
import 'package:saffron_hub/components/custom_text/text.dart';
import 'package:saffron_hub/provider/get_product.dart';

import '../../models/get_product_model.dart';

class GetProductScreen extends StatefulWidget {
  const GetProductScreen({Key? key}) : super(key: key);

  @override
  State<GetProductScreen> createState() => _GetProductScreenState();
}

class _GetProductScreenState extends State<GetProductScreen> {
  late GetProductController getProductController;
  // late ProductsList productsList;
  bool _isInit = true;

  @override
  Future<void> didChangeDependencies() async {
    // _isInit = true;
    await getData();
    super.didChangeDependencies();
  }

  Future<void> getData() async {
    print('111');
    if (_isInit) {
      print('444');
      getProductController = Provider.of<GetProductController>(context);

      await getProductController.getProductList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:
                    getProductController.getProductModel.productsList!.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        CustomCard(
                          height: 150.h,
                          width: 335.w,
                          cardRadius: 15.r,
                          cardColor: Colors.blue,
                          cardChild: Row(
                            children: [
                              CustomCard(
                                height: 200.h,
                                width: 150.w,
                                cardRadius: 15.r,
                                cardColor: Colors.redAccent,
                                cardChild: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r),
                                  ),
                                  child: Image.network(
                                    height: 130.h,
                                    width: MediaQuery.of(context).size.width,
                                    '${getProductController.getProductModel.productsList![index].productImage}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text:
                                        '${getProductController.getProductModel.productsList![index].productName}',
                                  ),
                                  CustomText(
                                    text:
                                        '${getProductController.getProductModel!.productsList![index].productPrice}',
                                  ),
                                  CustomText(
                                    text:
                                        '${getProductController.getProductModel!.productsList![index].productDescription}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
