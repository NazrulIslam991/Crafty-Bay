import 'package:crafty_bay/core/model/network_respons.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/home/data/models/home_slider.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class HomeSlideController extends GetxController {
  bool _getSlideInProgress = false;
  String? _errorMessege;
  List<HomeSlider> _sliders = [];

  bool get getSliderInProgress => _getSlideInProgress;

  String? get errorMessege => _errorMessege;
  List<HomeSlider> get sliders => _sliders;

  Future<bool> getHomeSliders() async {
    bool isSusscess = false;
    _getSlideInProgress = true;

    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      _errorMessege = null;
      List<HomeSlider> listOfSliders = [];
      for (Map<String, dynamic> jsonData
          in response.body?['data']['results'] ?? []) {
        listOfSliders.add(HomeSlider.fromJson(jsonData));
      }

      _sliders = listOfSliders;

      isSusscess = true;
    } else {
      _errorMessege = response.errorMessage;
    }
    _getSlideInProgress = false;
    update();

    return isSusscess;
  }
}
