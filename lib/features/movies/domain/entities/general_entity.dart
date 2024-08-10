import 'package:equatable/equatable.dart';

class GeneralEntity extends Equatable{
  final bool? success;
  final num? statusCode;
  final String? statusMessage;

  const GeneralEntity({this.success, this.statusCode, this.statusMessage});

  @override
  List<Object?> get props => [
    success,
    statusCode,
    statusMessage
  ];
}