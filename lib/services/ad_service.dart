import 'package:flutter/foundation.dart';

class AdService {
  Future<void> initialize() async {
    debugPrint('Ad service initialized');
  }

  void showBannerAd() {
    debugPrint('Banner ad requested');
  }

  void showRewardedAd() {
    debugPrint('Rewarded ad requested');
  }
}
