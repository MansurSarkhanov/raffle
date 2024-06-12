import 'package:flutter/material.dart';

class LiveWinnerWidget extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final String date;
  final String time;
  final VoidCallback onPressed;
  const LiveWinnerWidget({
    super.key,
    required this.date,
    required this.imageUrl,
    this.isActive = false,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: size.height * 0.22,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: isActive ? const Color(0xFFFF3F40) : const Color(0xFF3FD0FF)),
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUrl))),
              ),
              // Positioned(
              //   top: size.height * 0.02,
              //   left: size.width * 0.04,
              //   child: CircleAvatar(
              //     radius: size.width * 0.015,
              //     backgroundColor: isActive
              //         ? const Color(0xFF1A8C27)
              //         : const Color(0xFFBD1919),
              //   ),
              // ),
              Positioned(
                top: size.height * 0.175,
                left: size.width * 0.03,
                child: isActive
                    ? const Text(
                        'live',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Color(0xFFFF3F40)),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date,
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            time,
                            style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
      ],
    );
  }
}
