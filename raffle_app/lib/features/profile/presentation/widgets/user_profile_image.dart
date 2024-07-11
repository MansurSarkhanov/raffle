import 'package:flutter/material.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';

import '../../../auth/data/model/user_model.dart';
import '../../data/service/firebase_storage_service.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage(
      {super.key, required this.size, required this.userInfo, required this.storage, required this.notifier});

  final Size size;
  final UserModel? userInfo;
  final FirebaseStorageService storage;
  final ProfileNotifier notifier;

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
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
            widget.notifier.isLoadingImage
                ? const Center(child: CircularProgressIndicator())
                : CircleAvatar(
                    backgroundImage: widget.userInfo != null
                        ? NetworkImage(
                            widget.notifier.testImage == null
                                ? widget.userInfo?.image ?? ''
                                : widget.notifier.testImage!,
                          )
                        : MemoryImage(widget.storage.selectedImgeByte!),
                    radius: widget.size.height * 0.055,
                    backgroundColor: const Color(0xFFD9D9D9),
                  ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    widget.notifier.changeProfileImage(widget.storage);
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
            ),
          ],
        ),
      ),
    );
  }
}
