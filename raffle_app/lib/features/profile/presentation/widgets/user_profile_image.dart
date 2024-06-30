import 'package:flutter/material.dart';

import '../../../auth/data/model/user_model.dart';
import '../../../auth/data/service/firebase_storage_service.dart';

class UserProfileImage extends StatefulWidget {
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
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  String? testImage;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFD9D9D9),
      radius: widget.size.height * 0.085,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: widget.size.height * 0.065,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundImage: widget.userInfo != null
                  ? NetworkImage(
                      testImage == null ? widget.userInfo?.image ?? '' : testImage!,
                    )
                  : MemoryImage(widget.storage.selectedImgeByte!),
              radius: widget.size.height * 0.055,
              backgroundColor: const Color(0xFFD9D9D9),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () async {
                  testImage = await widget.storage.uploadImage();
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: widget.size.height * 0.017,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.height * 0.01, vertical: widget.size.height * 0.01),
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
