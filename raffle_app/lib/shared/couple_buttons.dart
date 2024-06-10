import 'package:flutter/material.dart';

///we use these couple buttons on multiple screens.So I have to write it in a custom form...
class CoupleButtons extends StatefulWidget {
  final Function({required int index}) function;
  final String buttonText1;
  final String buttonText2;
  final double borderRadius;
  final double height;
  int? indexFromOut;

  CoupleButtons({
    super.key,
    required this.buttonText1,
    required this.buttonText2,
    required this.function,
    this.borderRadius = 44,
    required this.height,
    this.indexFromOut,
  });

  @override
  State<CoupleButtons> createState() => _CoupleButtonsState();
}

class _CoupleButtonsState extends State<CoupleButtons> {
  //int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius), color: const Color(0xFFE1E1E1)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.function(index: 0);
                  //index = 0;
                  widget.indexFromOut = 0;
                });
              },
              child: Container(
                height: widget.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.indexFromOut == 0 ? Colors.white : const Color(0xFFE1E1E1),
                    borderRadius: BorderRadius.circular(widget.borderRadius)),
                child: Text(
                  widget.buttonText1,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.function(index: 1);
                  widget.indexFromOut = 1;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  height: widget.height,
                  decoration: BoxDecoration(
                      color: (widget.indexFromOut == 1 ? Colors.white : const Color(0xFFE1E1E1)),
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
                  child: Text(widget.buttonText2, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700))),
            ),
          ),
        ],
      ),
    );
  }
}
