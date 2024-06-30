import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_notifier.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_state.dart';
import 'package:raffle_app/presentation/pages/home/view/product_detail.dart';

import '../../../../presentation/components/shimmer_selling_fast.dart';
import '../widgets/blinking_liner_animation.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Consumer<ProductNotifier>(builder: (context, notifier, child) {
        if (notifier.state is ProductProgress) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const ShimmerSellingFast();
            },
          );
        } else if (notifier.state is ProductSuccess) {
          final productList = (notifier.state as ProductSuccess).productModel;
          final productModel = productList;
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: productList?.length,
            itemBuilder: (context, index) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {

                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ProductDetail(
                        model: productModel[index],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 110.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                image: DecorationImage(image: NetworkImage(productModel?[index].image ?? '')),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Prize: ${productModel?[index].prize ?? ''}",
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Buy: ${productModel?[index].buy ?? ''}",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "USD: ${productModel?[index].price ?? ''}",
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                                BlinkingWidget(
                                    controller: _controller,
                                    child: LinearPercentIndicator(
                                        animation: true,
                                        barRadius: const Radius.circular(25),
                                        lineHeight: 16.h,
                                        padding: EdgeInsets.zero,
                                        progressColor: productModel?[index] == 0 ? Colors.green : Colors.yellow[700],
                                        percent: productModel![index].percent! / 100,
                                        backgroundColor: const Color(0xffE6E6E6)),
                                  )
                                ,
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${productModel[index].leftPrice}',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '/${productModel[index].rightPrice} sold',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.9,
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
