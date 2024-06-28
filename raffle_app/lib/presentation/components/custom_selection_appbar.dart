import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';
import 'package:raffle_app/presentation/pages/wallet/wallet_card_page.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/path/image_path.dart';
import '../../core/utilities/helper/route.dart';
import '../../features/profile/presentation/notifier/profile_notifier.dart';
import '../../features/profile/presentation/page/profile_page.dart';

class CustomSelectionAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSelectionAppbar({
    super.key,
    required this.controller,
  });
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppIndexNotifier>(builder: (context, appIndexNotifier, child) {
      return AppBar(
        elevation: 0,
        backgroundColor: context.watch<AppIndexNotifier>().state == AppPartSection.left
            ? const Color(0xFFEBEBEB)
            : const Color(0xFFF9F9F9),
        toolbarHeight: 50,
        title: Row(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      RouteHelper.createRoute(
                          routeName: ChangeNotifierProvider.value(
                              value: context.read<ProfileNotifier>(), child: ProfilePage(controller: controller)),
                          location: RoutingLocation.leftToRight,
                          transitionTime: 400,
                          reverseTransitionTime: 400),
                    );
                  },
                  child: Container(
                    width: 55.w,
                    height: 47.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        // color:AppColors.standartWhiteColor,
                        color:
                            // appIndexNotifier.state == AppPartSection.left
                            //     ? Colors.white:
                            AppColors.unselectButtonColor),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      height: 28,
                      ImagePath.user_profile.toPathSvg,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 7),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  appIndexNotifier.setIndex(0);
                  controller.index = 0;
                },
                child: Container(
                  width: 115.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          appIndexNotifier.state == AppPartSection.left ? Colors.white : AppColors.unselectButtonColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h, width: 30.h, child: Image.asset(ImagePath.raffle_logo.toPathPng)),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('assets/svg/raffle_text.svg'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  appIndexNotifier.setIndex(2);
                },
                child: Container(
                  width: 115.w,
                  height: 47.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
                  child: Image.asset(appIndexNotifier.state == AppPartSection.right
                      ? 'assets/images/im_raffle_map.png'
                      : 'assets/images/im_unselected_map.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  RouteHelper.createRoute(
                      routeName: ChangeNotifierProvider.value(
                          value: context.read<ProfileNotifier>(),
                          child: WalletCardPage(
                            controller: controller,
                          )),
                      location: RoutingLocation.rightToLeft,
                      transitionTime: 500,
                      reverseTransitionTime: 250),
                );
              },
              child: Container(
                width: 55.w,
                height: 47.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color:
                      // appIndexNotifier.state == AppPartSection.right ? Colors.white :
                      AppColors.unselectButtonColor,
                ),
                child: Center(child: SvgPicture.asset(ImagePath.user_wallet.toPathSvg)),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
