import 'package:equatable/equatable.dart';

class Source extends Equatable {
  Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
