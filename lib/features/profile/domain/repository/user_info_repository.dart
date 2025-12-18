import 'package:multiple_result/multiple_result.dart';

import '../../../auth/data/model/user_model.dart';

abstract class UserInfoRepository {
  Future<Result<UserModel?, Exception>> getUserInfo();
}
