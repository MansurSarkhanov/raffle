//! ------ Select lang and Currency widget
import 'package:flutter/material.dart';

class SelectLangAndCurrency extends StatefulWidget {
  const SelectLangAndCurrency({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SelectLangAndCurrency> createState() => _SelectLangAndCurrencyState();
}

class _SelectLangAndCurrencyState extends State<SelectLangAndCurrency> {
  String selectedCurrency = '';
  String selectedLanguage = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: widget.size.height * 0.6,
      width: widget.size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 55,
            height: 5,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Language & Currency',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: widget.size.width,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Currency',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 237, 237, 237),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: RadioMenuButton(
                              value: 'dollar',
                              groupValue: selectedCurrency,
                              onChanged: (value) {
                                setState(() {
                                  selectedCurrency = value!;
                                });
                              },
                              child: const Row(
                                children: [
                                  Text('\$'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('USD'),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 237, 237, 237),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: RadioMenuButton(
                              value: 'euro',
                              groupValue: selectedCurrency,
                              onChanged: (value) {
                                setState(() {
                                  selectedCurrency = value!;
                                });
                              },
                              child: const Row(
                                children: [
                                  Text('€'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('Euro'),
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 237, 237, 237),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: RadioMenuButton(
                              value: 'lari',
                              groupValue: selectedCurrency,
                              onChanged: (value) {
                                setState(() {
                                  selectedCurrency = value!;
                                });
                              },
                              child: const Row(
                                children: [
                                  Text('₾'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('Lari'),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RadioMenuButton(
                      toggleable: true,
                      value: 'Turkey',
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/im_tr.png'))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Turkey',
                            style: TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                  RadioMenuButton(
                      toggleable: true,
                      value: 'English',
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/im_en.png'))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'English',
                            style: TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                  RadioMenuButton(
                      toggleable: true,
                      value: 'Russian',
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/im_ru.png'))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Russian',
                            style: TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      width: widget.size.width,
                      height: 47,
                      padding: const EdgeInsets.only(top: 11, bottom: 12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFF3C0AE1), Color(0xFF3D17E6)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
