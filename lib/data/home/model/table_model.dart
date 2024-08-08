import 'package:task/domain/home/entity/table_entity.dart';

class TableModel extends TableEntity {
  const TableModel({
    super.group,
    super.lotDescription,
    super.pcs,
    super.rate,
    super.sRate,
    super.sValue,
    super.units,
    super.value,
    super.weight,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      group: json['Group'] ?? '',
      lotDescription: json['Lot_Description'] ?? '',
      pcs: json['Pcs'] ?? 0.0,
      rate: json['Rate'] ?? 0.0,
      sRate: json['S_Rate'] ?? 0.0,
      sValue: json['S_Value'] ?? 0.0,
      units: json['Units'] ?? '',
      value: json['Value'] ?? 0.0,
      weight: json['Weight'] ?? 0.0,
    );
  }

  //Empty TableModel
  static TableModel empty = const TableModel(
    group: '',
    lotDescription: '',
    pcs: 0,
    rate: 0.0,
    sRate: 0.0,
    sValue: 0.0,
    units: '',
    value: 0.0,
    weight: 0.0,
  );
}
