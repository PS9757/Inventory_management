import 'package:equatable/equatable.dart';
import 'package:task/domain/home/entity/table_entity.dart';

class DataEntity extends Equatable{
  final String? barcode;
  final String? location;
  final String? branch;
  final String? status;
  final int? counter;
  final String? source;
  final String? category;
  final String? collection;
  final String? description;
  final String? metalGrp;
  final String? stkSection;
  final String? mfgdBy;
  final String? notes;
  final String? inStkSince;
  final String? certNo;
  final String? huidNo;
  final int? orderNo;
  final String? cusName;
  final String? size;
  final String? quality;
  final double? kt;
  final int? pcs;
  final double? grossWt;
  final double? netWt;
  final int? diaPcs;
  final double? diaWt;
  final int? clsPcs;
  final double? clsWt;
  final double? chainWt;
  final double? mRate;
  final double? mValue;
  final double? lRate;
  final double? lCharges;
  final double? rCharges;
  final double? oCharges;
  final double? mrp;
  final String? imageLink;
  final List<TableEntity>? tableEntity;

  const DataEntity({
    this.barcode,
    this.location,
    this.branch,
    this.status,
    this.counter,
    this.source,
    this.category,
    this.collection,
    this.description,
    this.metalGrp,
    this.stkSection,
    this.mfgdBy,
    this.notes,
    this.inStkSince,
    this.certNo,
    this.huidNo,
    this.orderNo,
    this.cusName,
    this.size,
    this.quality,
    this.kt,
    this.pcs,
    this.grossWt,
    this.netWt,
    this.diaPcs,
    this.diaWt,
    this.clsPcs,
    this.clsWt,
    this.chainWt,
    this.mRate,
    this.mValue,
    this.lRate,
    this.lCharges,
    this.rCharges,
    this.oCharges,
    this.mrp,
    this.imageLink,
    this.tableEntity,
  });

  @override
  List<Object?> get props => [
    barcode,
    location,
    branch,
    status,
    counter,
    source,
    category,
    collection,
    description,
    metalGrp,
    stkSection,
    mfgdBy,
    notes,
    inStkSince,
    certNo,
    huidNo,
    orderNo,
    cusName,
    size,
    quality,
    kt,
    pcs,
    grossWt,
    netWt,
    diaPcs,
    diaWt,
    clsPcs,
    clsWt,
    chainWt,
    mRate,
    mValue,
    lRate,
    lCharges,
    rCharges,
    oCharges,
    mrp,
    imageLink,
    tableEntity,
  ];
}