import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    bool? status,
    String? message,
    User? user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
