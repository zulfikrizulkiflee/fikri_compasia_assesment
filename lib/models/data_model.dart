import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Data extends Equatable {
  int? userId;
  int? id;
  String? title;

  Data({
    this.userId,
    this.id,
    this.title
  });

  Data.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  @override
  List<Object?> get props => [userId, id, title];
}