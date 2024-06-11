import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/data/local/shared_preferences_service.dart';

import '../../../auth/data/model/user_model.dart';
import '../../domain/repository/user_info_repository.dart';
import '../service/user_info_service.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  UserInfoRepositoryImpl({required this.userInforRepository, required this.sharedService});
  final UserInfoServiceImpl userInforRepository;
  final SharedPreferenceServiceImpl sharedService;
  @override
  Future<Result<UserModel?, Exception>> getUserInfo() async {
    try {
      final user = await userInforRepository.getUserInfo();
      if (user != null) {
        final userInfoModel = await user.get();
        print('object');

        print(userInfoModel.data()?.email);

        return Success(userInfoModel.data());
      }
      return Error(Exception());
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
