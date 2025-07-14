import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InternetChecker {
  static final InternetChecker _instance = InternetChecker._internal();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool isConnected = true;

  factory InternetChecker() {
    return _instance;
  }

  InternetChecker._internal() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      isConnected = results.isNotEmpty &&
          (results.contains(ConnectivityResult.wifi) || results.contains(ConnectivityResult.mobile));

      if (!isConnected) {
        showNoInternetDialog();
      }
    });
  }

  Future<void> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.isEmpty || connectivityResult.contains(ConnectivityResult.none)) {
      showNoInternetDialog();
    }
  }

  void showNoInternetDialog() {
    if (Get.isDialogOpen == true) return; // Prevent multiple dialogs

    Get.dialog(
      AlertDialog(
        title: Text("No Internet Connection"),
        content: Text("Please check your internet connection and try again."),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("OK"),
          ),
        ],
      ),
      barrierDismissible: false, // Prevent closing by tapping outside
    );
  }

  void onTapWithInternetCheck(Function() action) {
    if (!isConnected) {
      showNoInternetDialog();
      return;
    }
    action();
  }

  void dispose() {
    _subscription.cancel();
  }
}
