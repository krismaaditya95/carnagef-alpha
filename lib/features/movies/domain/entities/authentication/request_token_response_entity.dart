import 'package:equatable/equatable.dart';

class RequestTokenResponseEntity extends Equatable {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;

  const RequestTokenResponseEntity({
    this.success,
    this.expiresAt,
    this.requestToken});

  @override
  List<Object?> get props => [
    success,
    expiresAt,
    requestToken
  ];
}