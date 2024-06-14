import 'package:flutter/material.dart';

class OffersWidget extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final String title;
  final String body;
  final String subTitle;
  final Color buttonTextColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String buttonText;
  const OffersWidget({
    super.key,
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.body,
    required this.buttonTextColor,
    required this.subTitle,
    required this.textColor,
    required this.title,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 253,
              width: size.width * 0.93,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [backgroundColor1, backgroundColor2]),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: size.height * 0.05,
                    // ),
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.08,
                      child: Text(
                        body,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.04,
                      child: Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          //
                          color: textColor, //
                          fontSize: 14, //
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: onPressed,
                      child: Container(
                        height: size.height * 0.061,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: Text(
                          buttonText,
                          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }
}
