import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/auth/data/model/user_model.dart';

import '../../../../features/auth/presentation/widgets/custom_text_field.dart';
import '../../../../raffle_co/view/wallet_tab.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorCard(
            downColor: Color(0xFFEEEEEE),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A026C),
                Color(0xFF7518E8),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopUpAppBar(
                text: 'My Details',
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.person_3_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                            isValidate: true,
                            controller: nameController..text = widget.userModel.name!,
                            textFieldImage: null,
                            hintText: 'Name',
                            height: size.height * 0.07,
                            width: size.width * 0.43),
                        CustomTextField(
                            isValidate: true,
                            controller: surNameController..text = widget.userModel.surname!,
                            textFieldImage: null,
                            hintText: 'Surname',
                            height: size.height * 0.07,
                            width: size.width * 0.43),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      backColor: const Color(0xFFE1CFF6),
                      isValidate: true,
                      controller: emailController..text = widget.userModel.email!,
                      textFieldImage: null,
                      height: size.height * 0.07,
                      width: size.width,
                      hintText: 'Email address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        isValidate: true,
                        keyboardType: TextInputType.number,
                        controller: numberController..text = widget.userModel.number!,
                        textFieldImage: null,
                        height: size.height * 0.07,
                        width: size.width,
                        hintText: 'Mobile number'),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF1C29D1),
                                Color(0xFF7166FE),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(34.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 55),
                            child: Text(
                              'Update',
                              style: context.typography.body2Regular.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TopUpAppBar extends StatelessWidget {
  const TopUpAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(26, 26)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0C0059),
            Color(0xFF6311D4),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 56.0, bottom: 21),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/svg/ic_arrow_back.svg',
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: context.typography.body2Bold
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
