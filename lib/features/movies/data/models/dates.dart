import 'package:carnagef_alpha/features/movies/domain/entities/date_entity.dart';

class Dates extends DatesEntity{

  // String? maximum;
  // String? minimum;

  const Dates({
    String? maximum,
    String? minimum
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
        maximum: json['maximum'] ?? "",
        minimum: json['minimum'] ?? ""
    );

  }

  Map<String, dynamic> toJson() => {
    "maximum": maximum,
    "minimum": minimum
  };
}