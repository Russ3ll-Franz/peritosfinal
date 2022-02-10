import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:peritosapp/data/model/user/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  final bool? status;
  final String? message;
  final User? user;

  const UserResponse({this.status, this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => [status, message, user];
}
