import 'package:dio/dio.dart';
import 'package:skapi_obligations/common/extension/dio_exception_extension.dart';
import 'package:skapi_obligations/features/obligations/domain/models/gold_obligation/gold_customre_data.dart';

import '../../../../common/utils/network_client/resource.dart';
import '../../domain/models/other_obligation/other_customer_data.dart';
import '../../domain/repository/obligations_repository.dart';
import '../data_source/obligations_remote_data_source.dart';

class ObligationsRepositoryImpl implements ObligationsRepository {
  ObligationsRepositoryImpl(this._remoteDataSource);

  final ObligationsRemoteDataSource _remoteDataSource;

  @override
  Future<Resource<OtherCustomerData>> getOtherObligations() async {
    try {
      final response = await _remoteDataSource.getOtherObligations();
      if (response.statusCode == 200) {
        final data = OtherCustomerData.fromJson(response.data);
        return Success(data);
      } else {
        return Error(SkapiErrorType.unknown);
      }
    } on DioException catch (dioError) {
      return Error(dioError.toSkapiErrorType());
    } catch (_) {
      return Error(SkapiErrorType.unknown);
    }
  }

  @override
  Future<Resource<GoldCustomerData>> getGoldObligations() async {
    try {
      final response = await _remoteDataSource.getGoldObligations();
      if (response.statusCode == 200) {
        final data = GoldCustomerData.fromJson(response.data);
        return Success(data);
      } else {
        return Error(SkapiErrorType.unknown);
      }
    } on DioException catch (dioError) {
      return Error(dioError.toSkapiErrorType());
    } catch (_) {
      return Error(SkapiErrorType.unknown);
    }
  }

  @override
  Future<Resource<List<int>>> getObligationsTransactions() async {
    try {
      final response = await _remoteDataSource.getObligationsTransactions();

      if (response.statusCode == 200) {
        return Success(response.data as List<int>);
      } else {
        return Error(SkapiErrorType.unknown);
      }
    } on DioException catch (dioError) {
      return Error(dioError.toSkapiErrorType());
    } catch (_) {
      return Error(SkapiErrorType.unknown);
    }
  }
}
