import 'dart:developer';

import 'package:feature_based_mvvm_architecture/navigation_screen.dart';
import 'package:flutter/material.dart';

import 'app/constants/app_constants.dart';
import 'shared/networks/dio/dio.dart';
import 'utils/di.dart';
import 'utils/helper_methods.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await setInitValue();

    if (appData.read(kKeyIsLoggedIn)) {
      final String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      // LocalNotificationService.getToken(); // Uncomment when needed
    }

    // _loadWishlistData();

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  // void _loadWishlistData() {
  //   final wishlistBox = hiveBox.get(kKeyWishlistitems, defaultValue: []);
  //   final wishlistItems = List<WishlistLocalModel>.from(wishlistBox);

  //   final wishlistProvider = Provider.of<WishlistProvder>(
  //     context,
  //     listen: false,
  //   );
  //   wishlistProvider.wishlistItems.addAll(wishlistItems.map((item) => item.id));
  // }

  @override
  Widget build(BuildContext context) {
    log("inside lodding build");
    if (_isLoading) {
      return const WelcomeScreen();
    }

    // Optional logic to choose between explore/login
    // final bool isLoggedIn = appData.read(kKeyIsLoggedIn);
    // final bool isExploring = appData.read(kKeyIsExploring);
    // return (isLoggedIn || isExploring) ? const NavigationScreen() : const LoginScreen();

    return NavigationScreen();
  }
}
