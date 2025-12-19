import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/raffle_co/view/wallet_tab.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {

  int currentIndex= 0;

  void selectAmount(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final amounts=['AED25.00','AED50.00','AED100.00','AED150.00','AED200.00'];
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorCard(
            downColor: Color(0xFFEEEEEE),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF01EE8A),
                Color(0xFF1AFCAA),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopUpAppBar(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Select top-up amount',
                  style: context.typography.body2Bold.copyWith(fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 67.h,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: amounts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: ()=>selectAmount(index),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19),
                              border: currentIndex==index
                                  ? Border.all(
                                      color: const Color(0xFF4000FF), width: 4, strokeAlign: BorderSide.strokeAlignInside)
                                  : Border.all(color: Colors.white, width: 4, strokeAlign: BorderSide.strokeAlignInside)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 21),
                            child: Text(
                             amounts[index],
                              style: context.typography.body2Bold.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Center(
                        child: Text(
                          'or enter amount (min. AED50.00)',
                          style: context.typography.body2Bold.copyWith(color: const Color(0xFFC9C9C9), fontSize: 16),
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Select method',
                  style: context.typography.body2Bold.copyWith(fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: const Color(0xFF4000FF), width: 4, strokeAlign: BorderSide.strokeAlignInside)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 39.0, horizontal: 24),
                          child: Row(children: [
                            const Icon(Icons.apple),
                            Text(
                              'Pay',
                              style: context.typography.body2Bold.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(color: Colors.white, width: 4, strokeAlign: BorderSide.strokeAlignInside)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 23.0, horizontal: 24),
                          child: Column(children: [
                            Container(
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFDFDFDF)),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Add new',
                              style: context.typography.body2Bold
                                  .copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF7C7C7C)),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 21),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Amount',
                            style: context.typography.body2Bold.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'AED50.00',
                            style: context.typography.body2Bold.copyWith(fontSize: 27, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'You will pay AED50.00\nYou will receive total AED50.00',
                            style: context.typography.body2Bold.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(34)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.apple,
                                  size: 34,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Pay",
                                  style: context.typography.body2Bold.copyWith(fontSize: 24, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class TopUpAppBar extends StatelessWidget {
  const TopUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(26, 26)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF01A81A),
            Color(0xFF01EE8A),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 56.0, bottom: 21),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/svg/ic_arrow_back.svg'),
              ),
              const Spacer(),
              Text(
                'Top-up',
                style: context.typography.body2Bold.copyWith(fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
