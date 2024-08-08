import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/error/failure.dart';
import 'package:task/domain/home/entity/data_entity.dart';
import 'package:task/domain/home/usecase/get_data_usecase.dart';

part 'search_data_state.dart';

@injectable
class SearchDataCubit extends Cubit<SearchDataState> {
  final GetDataUsecase getDataUsecase;

  SearchDataCubit(this.getDataUsecase) : super(SearchDataState());

  Future<List<String>> getSelectedData(String pattern) async {
    return state.data!
        .where((element) =>
            element.barcode!.toLowerCase().contains(pattern.toLowerCase()))
        .map((e) => e.barcode!)
        .toList();
  }

  void setSelectedData(String barcode) {
    final data =
        state.data!.where((element) => element.barcode == barcode).first;
    emit(state.copyWith(selectedData: data));
  }

  void getData() async {
    emit(state.copyWith(status: Status.loading));
    final result = await getDataUsecase(null);

    result.fold(
      (failure) {
        emit(state.copyWith(failure: failure, status: Status.error));
      },
      (data) {
        emit(state.copyWith(data: data, status: Status.loaded));
      },
    );
  }
}
