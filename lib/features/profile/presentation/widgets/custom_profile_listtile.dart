import 'package:flutter/material.dart';

class CustomProfileListtileWidget extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Widget icon;
  final bool isBottomDividerActive;
  const CustomProfileListtileWidget(
      {super.key, required this.icon, required this.imageUrl, this.isBottomDividerActive = true, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 23,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            icon,
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        if (isBottomDividerActive)
          const Divider(
            color: Color(0xFFE8E8E8),
            thickness: 2,
          ),
      ],
    );
  }
}
