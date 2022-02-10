import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/data/model/user/request/user_request.dart';
import 'package:peritosapp/data/model/user/response/user_response.dart';
import 'package:peritosapp/data/network/http_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {}
