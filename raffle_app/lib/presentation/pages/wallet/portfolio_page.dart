import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/custom_text.dart';
import '../../components/go_back_button.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool isSelected = true;

  void selectItem() {
    isSelected = !isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: const Color(0xFFF1F1F1),
        backgroundColor: const Color(0xFFF1F1F1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GoBackButton(
                buttonBackColor: const Color(0xFFD9D9D9),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            const Spacer(
              flex: 2,
            ),
            TitleHeading1Widget(
              text: 'My portfilio',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SelectedButton(
                  title: 'Restaurants',
                  isSelected: true,
                ),
                SizedBox(width: 19.w),
                const SelectedButton(
                  title: 'Hotels',
                ),
                SizedBox(width: 19.w),
                const SelectedButton(
                  title: 'Shop',
                )
              ],
            ),
            const SizedBox(height: 19),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const RestorantOrderCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RestorantOrderCard extends StatelessWidget {
  const RestorantOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.w),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleHeading1Widget(text: 'Active balance', fontSize: 13.sp, fontWeight: FontWeight.w400),
                  const SizedBox(
                    height: 8,
                  ),
                  TitleHeading1Widget(text: '36.50 \$', fontSize: 26.sp, fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_up_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: '13.50 \$ ',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red)),
                            TextSpan(
                              text: '(remaining balance)',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/im_agalarova.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const TitleHeading1Widget(
                    text: 'NOVİKOV GROUP',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedButton extends StatelessWidget {
  const SelectedButton({
    super.key,
    required this.title,
    this.isSelected = false,
  });
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.2.w),
          gradient: isSelected
              ? RadialGradient(
                  radius: 30,
                  colors: [const Color(0xFFD9D9D9), const Color(0xFF000000).withOpacity(0), const Color(0xFF000000)],
                )
              : null),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Center(
            child: TitleHeading1Widget(
          text: title,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        )),
      ),
    ));
  }
}
