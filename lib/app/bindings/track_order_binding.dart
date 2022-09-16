import 'package:get/get.dart';

import '../controllers/TrackOrderController.dart';
import '../data/service/logitrackapi_service.dart';

class TrackOrderBinding implements Bindings {
@override
void dependencies() async {
  Get.lazyPut<TrackOrderController>(() => TrackOrderController(LogitrackApiService()));
  }

}