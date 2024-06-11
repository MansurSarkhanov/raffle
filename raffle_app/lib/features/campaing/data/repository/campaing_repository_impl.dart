import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/campaing/data/model/campaing_model.dart';
import 'package:raffle_app/features/campaing/data/service/campaing_service.dart';

import '../../domain/repository/campaing_repository.dart';

final class CampaingRepositoryImpl implements CampaingRepository {
  CampaingRepositoryImpl({required this.campaingService});
  final CampaingServiceImpl campaingService;
  @override
  Future<Result<List<CampaingModel>?, Exception>> getCampaings() async {
    try {
      final campaingList = await campaingService.getCampaings();
      if (campaingList is List) {
        return Result.success(campaingList);
      }
    } on Exception catch (e) {
      return Error(Exception(e));
    }
    return Error(Exception('Something went wrong'));
  }
}
