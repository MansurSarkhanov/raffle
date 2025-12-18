import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../notifier/profile_state.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});
  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Consumer<ProfileNotifier>(builder: (context, notifier, child) {
        if (notifier.state is ProfileProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (notifier.state is ProfileError) {
          return const Center(
            child: Text("Error"),
          );
        }
        final userInfo = notifier.user;
        return SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.07),
              child: Column(
                children: [
                  detailHeader(context),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFD9D9D9),
                    radius: size.height * 0.075,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: size.height * 0.055,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: userInfo != null
                                ? NetworkImage(
                                    userInfo.image ?? '',
                                  )
                                : const AssetImage('assets/images/im_person.png'),
                            radius: size.height * 0.045,
                            backgroundColor: const Color(0xFFD9D9D9),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () async {
                                // await storage.pickImage();
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: size.height * 0.017,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.height * 0.01, vertical: size.height * 0.01),
                                  child: const Image(image: AssetImage('assets/icons/ic_plus.png')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomProfileTextField(
                      labelText: 'First name', controller: nameController..text = userInfo?.name ?? ''),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomProfileTextField(
                      labelText: 'Last name', controller: lastNameController..text = userInfo?.surname ?? ''),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomProfileTextField(
                      labelText: 'Email address', controller: emailController..text = userInfo?.email ?? ''),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.03,
                    ),
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleHeading1Widget(
                              text: 'Country code',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Text(
                                    '+',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.006,
                          color: const Color(0xFFD9D9D9),
                        ),
                        SizedBox(width: size.width * 0.01),
                        Expanded(
                          child: CustomProfileTextField(
                              space: true,
                              controller: numberController..text = userInfo?.number ?? '',
                              labelText: 'Mobile number'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                      width: size.width,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                      child: const GenderRow()),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                ],
              )),
        );
      }),
    );
  }

  Row detailHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GoBackButton(
          buttonBackColor: const Color(0xFFD9D9D9),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Text(
          'Personal Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  TextStyle textSyleBold() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }
}

class CustomProfileTextField extends StatelessWidget {
  const CustomProfileTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.space,
  });
  final TextEditingController controller;
  final String labelText;
  final bool? space;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHeading1Widget(
              text: labelText,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            if (space == true) ...[
              const SizedBox(
                height: 4,
              ),
            ],
            TextField(
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                focusedBorder: border,
                enabledBorder: border,
              ),
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class GenderRow extends StatefulWidget {
  const GenderRow({super.key});

  @override
  _GenderRowState createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
  bool? isMale = false;
  bool? isFemale = false;
  bool? isActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GenderBtn(
            btmLeftRad: 10,
            topLeftRad: 10,
            btmRightRad: 0,
            topRightRad: 0,
            text: 'Male',
            color: isActive == false
                ? const Color(0xFF435784)
                : isMale == true
                    ? const Color(0xFF435784)
                    : Colors.transparent,
            textColor: isActive == false
                ? Colors.white
                : isMale == true
                    ? Colors.white
                    : Colors.black,
            onTap: () {
              setState(() {
                isMale = true;
                isFemale = false;
              });
            },
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: GenderBtn(
            btmLeftRad: 0,
            topLeftRad: 0,
            btmRightRad: 10,
            topRightRad: 10,
            text: 'Female',
            color: isFemale == false ? Colors.transparent : const Color(0xFF435784),
            textColor: isFemale == true ? Colors.white : Colors.black,
            onTap: () {
              setState(() {
                isFemale = true;
                isMale = false;
                isActive = true;
              });
            },
          ),
        ),
      ],
    );
  }
}

class GenderBtn extends StatelessWidget {
  final String text;
  final Color? color;
  bool? isActive;
  final Color? textColor;
  final VoidCallback onTap;
  final double? topLeftRad;
  final double? btmLeftRad;
  final double? topRightRad;
  final double? btmRightRad;

  GenderBtn(
      {super.key,
      required this.text,
      this.color,
      this.textColor,
      required this.onTap,
      this.topLeftRad = 10,
      this.btmLeftRad = 10,
      this.topRightRad = 10,
      this.btmRightRad = 10,
      this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRad!),
            bottomLeft: Radius.circular(btmLeftRad!),
            bottomRight: Radius.circular(btmRightRad!),
            topRight: Radius.circular(topRightRad!),
          ),
        ),
        child: Center(child: Text(text, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w700))),
      ),
    );
  }
}
