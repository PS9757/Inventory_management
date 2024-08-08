import 'package:equatable/equatable.dart';

class TableEntity extends Equatable {
  final String? lotDescription;
  final String? group;
  final String? units;
  final int? pcs;
  final double? weight;
  final double? rate;
  final double? value;
  final double? sRate;
  final double? sValue;

  const TableEntity({
    this.lotDescription,
    this.group,
    this.units,
    this.pcs,
    this.weight,
    this.rate,
    this.value,
    this.sRate,
    this.sValue,
  });

  @override
  List<Object?> get props => [
        lotDescription,
        group,
        units,
        pcs,
        weight,
        rate,
        value,
        sRate,
        sValue,
      ];
}
