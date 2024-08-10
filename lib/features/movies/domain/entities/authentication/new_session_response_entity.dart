import 'package:equatable/equatable.dart';

class NewSessionResponseEntity extends Equatable {
  final bool? success;
  final String? sessionId;

  const NewSessionResponseEntity({
    this.success,
    this.sessionId});

  @override
  List<Object?> get props => [
    success,
    sessionId
  ];
}