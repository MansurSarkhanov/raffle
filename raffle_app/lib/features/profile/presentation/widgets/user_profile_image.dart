import 'package:flutter/material.dart';

import '../../../auth/data/model/user_model.dart';
import '../../../auth/data/service/firebase_storage_service.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.size,
    required this.userInfo,
    required this.storage,
  });

  final Size size;
  final UserModel? userInfo;
  final FirebaseStorageService storage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFD9D9D9),
      radius: size.height * 0.085,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: size.height * 0.065,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundImage: userInfo != null
                  ? NetworkImage(
                      userInfo?.image ?? '',
                    )
                  : const AssetImage('assets/images/im_person.png'),
              radius: size.height * 0.055,
              backgroundColor: const Color(0xFFD9D9D9),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () async {
                  await storage.pickImage();
                  // setState(() {});
                },
                child: CircleAvatar(
                  radius: size.height * 0.017,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.height * 0.01, vertical: size.height * 0.01),
                    child: const Image(image: AssetImage('assets/icons/ic_plus.png')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
