import 'package:injectable/injectable.dart';
import 'package:task/data/home/model/data_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

abstract class HomeDataSource {
  Future<List<DataModel>> getHomeData();
}

@LazySingleton(as: HomeDataSource)
class HomeDatasourceImpl extends HomeDataSource {
  @override
  Future<List<DataModel>> getHomeData() async {
    String jsonString = await rootBundle.loadString('json/data.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<DataModel> data = (jsonData['Items'] as List<dynamic>).map((item) {
      return DataModel.fromJson(item as Map<String, dynamic>);
    }).toList();
    return data;
  }
}
