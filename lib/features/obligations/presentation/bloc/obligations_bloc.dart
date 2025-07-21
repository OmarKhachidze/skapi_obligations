import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skapi_obligations/common/utils/network_client/resource.dart';
import 'package:skapi_obligations/features/obligations/domain/repository/obligations_repository.dart';
import 'obligation_event.dart';
import 'obligations_state.dart';

class ObligationsBloc extends Bloc<ObligationsEvent, ObligationsData> {
  ObligationsBloc(this.repository) : super(const ObligationsData()) {
    on<FetchObligations>(_handleFetchObligations);
    on<ClearObligationsError>(_handleClearError);
  }

  final ObligationsRepository repository;

  Future<void> _handleFetchObligations(
    FetchObligations event,
    Emitter<ObligationsData> emit,
  ) async {
    switch (event.type) {
      case ObligationType.other:
        await _handleApiCall(
          emit,
          () => repository.getOtherObligations(),
          (data) => _getCurrentState().copyWith(
            otherObligations: data,
            isLoadingOther: false,
          ),
          loadingState: _getCurrentState().copyWith(
            isLoadingOther: true,
            clearError: true,
          ),
        );
        break;
      case ObligationType.gold:
        await _handleApiCall(
          emit,
          () => repository.getGoldObligations(),
          (data) => _getCurrentState().copyWith(
            goldObligations: data,
            isLoadingGold: false,
          ),
          loadingState: _getCurrentState().copyWith(
            isLoadingGold: true,
            clearError: true,
          ),
        );
        break;
      case ObligationType.transactions:
        await _handleApiCall(
          emit,
          () => repository.getObligationsTransactions(),
          (data) => _getCurrentState().copyWith(
            transactions: data,
            isLoadingTransactions: false,
          ),
          loadingState: _getCurrentState().copyWith(
            isLoadingTransactions: true,
            clearError: true,
          ),
        );
        break;
    }
  }

  void _handleClearError(
    ClearObligationsError event,
    Emitter<ObligationsData> emit,
  ) {
    emit(_getCurrentState().copyWith(clearError: true));
  }

  Future<void> _handleApiCall<T>(
    Emitter<ObligationsData> emit,
    Future<Resource<T>> Function() apiCall,
    ObligationsData Function(T data) successState, {
    required ObligationsData loadingState,
  }) async {
    emit(loadingState);
    final result = await apiCall();
    switch (result) {
      case Success(data: final data):
        emit(successState(data));
        break;
      case Error(errorType: final err):
        emit(
          _getCurrentState().copyWith(
            isLoadingOther: false,
            isLoadingGold: false,
            isLoadingTransactions: false,
            error: err,
          ),
        );
        break;
    }
  }

  ObligationsData _getCurrentState() {
    return state;
  }
}
