import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    /* return SafeArea(
        child: Center(
      child: Lottie.asset(
        'assets/json/loading_animation.json',
        height: height ?? 200,
        width: width ?? 200,
      ),
    )); */

    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/loading_animation.json',
                height: height ?? 200,
                width: width ?? 200,
              ),
            ],
          )),
    );
  }
}
