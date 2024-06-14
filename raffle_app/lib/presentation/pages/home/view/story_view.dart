import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  List<String> imageUrls = ['assets/images/im_step1.jpg', 'assets/images/im_step2.jpg', 'assets/images/im_step3.jpg'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: DismissiblePage(
        onDismissed: () => Navigator.pop(context),
        direction: DismissiblePageDismissDirection.down,
        child: StoryPageView(
          indicatorDuration: const Duration(seconds: 2),
          showShadow: false,
          indicatorPadding: const EdgeInsets.only(top: 10),
          onPageLimitReached: () => Navigator.pop(context),
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          itemBuilder: (context, pageIndex, storyIndex) {
            return Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(image: AssetImage(imageUrls[storyIndex]), fit: BoxFit.cover),
              ),
            );
          },
          storyLength: (pageIndex) {
            return imageUrls.length;
          },
          pageLength: 1,
        ),
      ),
    );
  }
}
