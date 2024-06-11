import 'package:multiple_result/multiple_result.dart';

import '../../data/model/campaing_model.dart';

abstract class CampaingRepository {
  Future<Result<List<CampaingModel>?, Exception>> getCampaings();
}
