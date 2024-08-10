import 'package:equatable/equatable.dart';

class DatesEntity extends Equatable{
  final String? maximum;
  final String? minimum;

  const DatesEntity({this.maximum, this.minimum});

  @override
  // TODO: implement props
  List<Object?> get props => [
    maximum,
    minimum
  ];
}