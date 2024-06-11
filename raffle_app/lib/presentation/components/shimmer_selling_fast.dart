import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSellingFast extends StatelessWidget {
  const ShimmerSellingFast({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 70.58,
                    width: 193.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 133.3,
                    height: 10,
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 40,
                    height: 8,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 133.3,
                    height: 8,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 40,
                    height: 9,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 18,
                    width: size.width,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 10,
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 10,
                        width: 50,
                        color: Colors.white,
                      ),
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
    );
  }
}
