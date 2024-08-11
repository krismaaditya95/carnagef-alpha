import 'package:equatable/equatable.dart';

class RequestTokenResponseEntity extends Equatable {
  final bool? success;
  final String? expiresAt;
  final String? requestToken;
  final num? statusCode;
  final String? statusMessage;

  const RequestTokenResponseEntity({
    this.success,
    this.expiresAt,
    this.requestToken,
    this.statusCode,
    this.statusMessage
  });

  @override
  List<Object?> get props => [
    success,
    expiresAt,
    requestToken,
    statusCode,
    statusMessage
  ];
}