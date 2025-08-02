import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class WalletEntityRequest extends Equatable {
  String token;
  WalletEntityRequest({required this.token});
  @override
  List<Object?> get props => [token];
}
