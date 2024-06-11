import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_notifier.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_state.dart';

import '../../../../presentation/components/shimmer_selling_fast.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      //height: 226,
      height: 200,
      width: size.width,
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
              return Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Container(
                            height: 70.58,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(image: NetworkImage(productModel?[index].image ?? ''))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Prize: ${productModel?[index].prize ?? ''}"),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("Buy: ${productModel?[index].buy ?? ''}"),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("USD: ${productModel?[index].price ?? ''}"),
                          const SizedBox(
                            height: 2,
                          ),
                          LinearPercentIndicator(
                              barRadius: const Radius.circular(52),
                              animation: false,
                              // curve:Curves.bounceOut,
                              animationDuration: 1500,
                              lineHeight: 16,
                              percent: productModel![index].percent! / 100,
                              padding: EdgeInsets.zero,
                              backgroundColor: const Color(0xfff1f1f1),
                              progressColor: Colors.yellow[700],
                              center: Center(
                                child: Text("${productModel[index].percent.toString()} %"),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${productModel[index].leftPrice}'),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('/${productModel[index].rightPrice}'),
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
              );
            },
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
