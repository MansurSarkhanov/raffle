import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_notifier.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_state.dart';
import 'package:raffle_app/presentation/pages/home/view/product_detail.dart';

import '../../../../presentation/components/shimmer_selling_fast.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152.h,
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
            padding: const EdgeInsets.only(left: 14),
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
                        model: productModel![index],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.78,
                          height: 134.h,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(29), color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6, top: 6),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 152.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Win',
                                      textAlign: TextAlign.start,
                                      style: context.typography.body1Bold.copyWith(
                                          color: const Color(0xFFFF2735),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          height: 0.9,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      "${productModel?[index].prize}",
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      style: context.typography.body2Bold
                                          .copyWith(fontSize: 13, height: 0.9, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: const Color(0xFFFF217E),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                                        child: Center(
                                          child: Text('Closing in 23:57:24',
                                              style: context.typography.body2Bold.copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFFFF217E),
                                              )),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          width: 142.w,
                                          height: 31,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFE600),
                                            borderRadius: BorderRadius.circular(15.5.r),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF4341E4),
                                                Color(0xFF25247E),
                                              ],
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(13.0),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 148.h,
                          width: MediaQuery.of(context).size.width * 0.37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(productModel?[index].image ?? ''), fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 33,
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
