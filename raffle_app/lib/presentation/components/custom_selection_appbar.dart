import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';

import '../../core/constants/path/image_path.dart';
import '../../core/utilities/helper/route.dart';
import '../../features/profile/presentation/notifier/profile_notifier.dart';
import '../../features/profile/presentation/page/profile_page.dart';

class CustomSelectionAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSelectionAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFF1F1F1),
      forceMaterialTransparency: true,
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
                          value: context.read<ProfileNotifier>(),
                          child: const ProfilePage()),
                      location: RoutingLocation.leftToRight,
                    ),
                  );
                },
                child: Container(
                  width: 56,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // color:AppColors.standartWhiteColor,
                      color: Colors.white),
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
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 116,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30, width: 30, child: Image.asset(ImagePath.raffle_logo.toPathPng)),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'raffle',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 116,
              height: 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  //  fit: BoxFit.fitWidth,

                  'assets/images/im_unselected_map.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Container(
                width: 56,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFCECECE),
                ),
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.only(left: 1.3),
                    child: SvgPicture.asset(ImagePath.user_wallet.toPathSvg)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
