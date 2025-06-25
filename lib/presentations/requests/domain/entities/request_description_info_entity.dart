import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestDescriptionInfoEntity extends Equatable {
  int userId;
  int roomNumbers;
  int bathroomNumbers;
  int propertyAge;
  int overlook;
  int legalCheck;
  int expertCheck;
  String propertyType;
  String areaSize;
  String decoration;
  String kitchenType;
  String flooringType;
  String balconySize;
  String paintingType;
  String price;
  String payWay;
  String state;
  String exactPosition;
  String contract;
  String? status;
  RequestDescriptionInfoEntity({
    required this.userId,
    required this.roomNumbers,
    required this.bathroomNumbers,
    required this.propertyAge,
    required this.overlook,
    required this.legalCheck,
    required this.exactPosition,
    required this.paintingType,
    required this.areaSize,
    required this.decoration,
    required this.kitchenType,
    required this.flooringType,
    required this.balconySize,
    required this.price,
    required this.payWay,
    required this.state,
    required this.expertCheck,
    required this.contract,
    required this.propertyType,
    this.status,
  });
  factory RequestDescriptionInfoEntity.init() => RequestDescriptionInfoEntity(
    userId: -1,
    roomNumbers: -1,
    bathroomNumbers: -1,
    propertyAge: -1,
    overlook: -1,
    legalCheck: -1,
    exactPosition: '',
    paintingType: '',
    areaSize: '',
    decoration: '',
    kitchenType: '',
    flooringType: '',
    balconySize: '',
    price: '',
    payWay: '',
    state: '',
    expertCheck: -1,
    contract: '',
    propertyType: '',
    status: '',
  );

  @override
  List<Object?> get props => [
    userId,
    roomNumbers,
    bathroomNumbers,
    propertyAge,
    overlook,
    legalCheck,
    exactPosition,
    paintingType,
    areaSize,
    decoration,
    kitchenType,
    flooringType,
    balconySize,
    price,
    payWay,
    state,
    expertCheck,
    contract,
    propertyType,
  ];
}
