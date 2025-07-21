import 'package:skapi_obligations/features/obligations/domain/models/other_obligation/other_customer_data.dart';

import '../../../../common/utils/network_client/resource.dart';
import '../models/gold_obligation/gold_customre_data.dart';

abstract interface class ObligationsRepository {
  Future<Resource<OtherCustomerData>> getOtherObligations();

  Future<Resource<GoldCustomerData>> getGoldObligations();

  Future<Resource<List<int>>> getObligationsTransactions();
}
