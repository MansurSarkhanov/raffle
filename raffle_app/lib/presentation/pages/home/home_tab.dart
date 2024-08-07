import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/gif_path_ext.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/pages/home/view/story_view.dart';

import '../../../core/constants/path/gif_path.dart';
import '../../../core/constants/path/icon_path.dart';
import '../../../core/constants/path/image_path.dart';
import '../../../features/campaing/presentation/view/campaing_list.dart';
import '../../../features/product/presentation/view/product_list_view.dart';
import '../../../features/profile/presentation/notifier/profile_notifier.dart';
import '../../../features/profile/presentation/notifier/profile_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final TabController controller;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: 65,
          toolbarHeight: 0,
          backgroundColor: widget.controller.index == 1 ? const Color(0xFFF9F9F9) : const Color(0xFFEBEBEB),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 1.50),
            child: FlexibleSpaceBar(
              background: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                //  toolbarHeight: size.height * 0.075,
                centerTitle: false,
                title: Consumer<ProfileNotifier>(
                  builder: (context, notifier, child) {
                    if (notifier.state is ProfileProgress) {
                      return Row(
                        children: [
                          Expanded(
                            child: purpleContiner(
                              imageUrl: ImagePath.left_p.toPathSvg,
                              txt: 'Raffle ID',
                              txtTwo: '.....',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              child: purpleContiner(
                                imageUrl: ImagePath.right_p.toPathSvg,
                                txt: 'Wallet',
                                txtTwo: 'Balance: .... AZN',
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (notifier.state is ProfileSuccess) {
                      final user = (notifier.state as ProfileSuccess).user;
                      return Row(
                        children: [
                          Expanded(
                            child: purpleContiner(
                              imageUrl: ImagePath.left_p.toPathSvg,
                              txt: 'Account ID',
                              txtTwo: "Raffle  ${user?.raffleId}",
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              child: purpleContiner(
                                imageUrl: ImagePath.right_p.toPathSvg,
                                txt: 'Wallet',
                                txtTwo: 'Balance: ${user?.balance} AZN',
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 2),
                    GestureDetector(
                      // onTap: () =>
                      //     Get.to(() => const InstagramStoryScreen()),
                      onTap: () {
                        context.pushTransparentRoute(const StoryView());
                      },
                      child: Container(
                        width: widget.size.width,
                        // height: 404,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(GifPath.baner.toPath))),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: widget.size.width * 0.94,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Selling fast',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const ProductListView(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Explore Campaigns',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Sort',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.swap_vert,
                                    size: 22.75,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18))),
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: widget.size.height * 0.4,
                                  width: widget.size.width,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: widget.size.width * 0.05, top: widget.size.height * 0.03),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Sort Campaing',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () => Navigator.of(context).pop(),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    image:
                                                        DecorationImage(image: AssetImage(IconPath.close.toPathPng))),
                                              ),
                                            ),
                                            SizedBox(
                                              width: widget.size.width * 0.03,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: widget.size.height * 0.04,
                                        ),
                                        Column(
                                          children: [
                                            buildSortingList(context,
                                                size: widget.size,
                                                onPressed: (() {}),
                                                sortingText: 'Lowest to Highest Price',
                                                icon: Icons.arrow_upward),
                                            SizedBox(
                                              height: widget.size.height * 0.02,
                                            ),
                                            buildSortingList(context,
                                                size: widget.size,
                                                onPressed: (() {}),
                                                sortingText: 'Highest to Lowest Price',
                                                icon: Icons.arrow_downward),
                                            SizedBox(
                                              height: widget.size.height * 0.02,
                                            ),
                                            buildSortingList(context,
                                                size: widget.size,
                                                onPressed: (() {}),
                                                sortingText: 'Lowest to Highest Price',
                                                icon: Icons.arrow_upward),
                                            SizedBox(
                                              height: widget.size.height * 0.02,
                                            ),
                                            buildSortingList(context,
                                                size: widget.size,
                                                onPressed: (() {}),
                                                sortingText: 'Highest to Lowest Price',
                                                icon: Icons.arrow_downward),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CampaingList()
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  InkWell buildSortingList(context,
      {Size? size, required VoidCallback onPressed, required String sortingText, required IconData icon}) {
    return InkWell(
      onTap: () {
        onPressed();
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: size!.width * 0.02,
          ),
          Text(
            sortingText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

Stack purpleContiner({required String imageUrl, required String txt, required txtTwo}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      SvgPicture.asset(
        imageUrl,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 6,
          ),
          TitleHeading1Widget(
            text: txt,
            textAlign: TextAlign.right,
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
          SizedBox(
            width: 150,
            child: TitleHeading1Widget(
              textOverflow: TextOverflow.fade,
              text: txtTwo,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ],
  );
}
