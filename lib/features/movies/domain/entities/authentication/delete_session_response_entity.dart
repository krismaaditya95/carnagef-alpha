import 'package:equatable/equatable.dart';

class DeleteSessionResponseEntity extends Equatable {
  final bool? success;

  const DeleteSessionResponseEntity({this.success});

  @override
  List<Object?> get props => [
    success
  ];
}