import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest extends Equatable {
  final String? username;
  final String? password;

  const UserRequest({this.username, this.password});

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return _$UserRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  @override
  List<Object?> get props => [username, password];
}
