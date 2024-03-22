// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDataImpl _$$ProductDataImplFromJson(Map<String, dynamic> json) =>
    _$ProductDataImpl(
      productImageUrl1: json['productImageUrl1'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      priceJPY: json['priceJPY'] as int? ?? 0,
      numberOfSearcher: json['numberOfSearcher'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProductDataImplToJson(_$ProductDataImpl instance) =>
    <String, dynamic>{
      'productImageUrl1': instance.productImageUrl1,
      'productName': instance.productName,
      'priceJPY': instance.priceJPY,
      'numberOfSearcher': instance.numberOfSearcher,
    };
