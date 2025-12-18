import 'package:flutter/material.dart';

import '../../../../../components/custom_text.dart';

class SelectPeopleDialog extends StatefulWidget {
  const SelectPeopleDialog({
    super.key,
  });

  @override
  State<SelectPeopleDialog> createState() => _SelectPeopleDialogState();
}

class _SelectPeopleDialogState extends State<SelectPeopleDialog> {
  int adults = 0;
  int children = 0;

  void incrementAdultsCount() {
    setState(() {
      adults++;
    });
  }

  void deincrementAdultsCount() {
    setState(() {
      if (adults > 0) {
        adults--;
      }
    });
  }

  void incrementChildrenCount() {
    setState(() {
      children++;
    });
  }

  void deincrementChildrenCount() {
    setState(() {
      if (children > 0) {
        children--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
                const SizedBox(
                  height: 42,
                ),
                Row(
                  children: [
                    const TitleHeading1Widget(
                      text: 'Adults',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        deincrementAdultsCount();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD0D0D7)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                            child: TitleHeading1Widget(
                              text: '-',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TitleHeading1Widget(
                        text: '$adults',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        incrementAdultsCount();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignCenter),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
                          child: TitleHeading1Widget(
                            text: '+',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const TitleHeading1Widget(
                      text: 'Children',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        deincrementChildrenCount();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD0D0D7)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
                            child: TitleHeading1Widget(
                              text: '-',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TitleHeading1Widget(
                        text: '$children',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        incrementChildrenCount();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
                          child: TitleHeading1Widget(
                            text: '+',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 122,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(31),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Center(
                        child: TitleHeading1Widget(
                          text: "Update",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
