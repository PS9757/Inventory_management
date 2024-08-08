part of 'search_data_cubit.dart';

enum Status { loaded, loading, error }

class SearchDataState {
  SearchDataState({
    this.failure,
    this.data,
    this.status,
    this.selectedData,
  });

  final Failure? failure;
  final List<DataEntity>? data;
  final Status? status;
  final DataEntity? selectedData;

  SearchDataState copyWith({
    Failure? failure,
    List<DataEntity>? data,
    Status? status,
    DataEntity? selectedData,
  }) {
    return SearchDataState(
      failure: failure ?? this.failure,
      data: data ?? this.data,
      status: status ?? this.status,
      selectedData: selectedData ?? this.selectedData,
    );
  }
}
