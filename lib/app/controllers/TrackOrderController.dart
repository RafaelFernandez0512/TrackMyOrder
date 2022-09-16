import 'dart:async';

import 'package:get/get.dart';
import 'package:track_my_order_app/app/data/model/shipmentDropLines.dart';
import 'package:track_my_order_app/app/data/model/shiptment.dart';
import 'package:track_my_order_app/app/data/model/shiptmentDrop.dart';
import 'package:track_my_order_app/app/data/service/notification_service.dart';
import 'package:track_my_order_app/app/routes/app_pages.dart';
import '../data/service/logitrackapi_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/data/latest.dart' as tz;

class TrackOrderController extends GetxController with StateMixin {
Timer? timer;
late final LogitrackApiService _logitrackApiService;

ShiptmentModel? currentShiptment;
dynamic argumentData = Get.arguments;

RxInt currentDropIndex = 0.obs;
RxList<ShipmentDropModel> drops =RxList();
List<ShiptmentDropLinesModel> lines =[];
ShipmentDropModel currentDrop = ShipmentDropModel();
late NotificationService _notificationService;
String customerCode = '';
DropStatus dropStatus = DropStatus.InRoute;
TrackOrderController(LogitrackApiService logitrackApiService){

tz.initializeTimeZones();
_logitrackApiService = logitrackApiService;
_notificationService  = NotificationService();
  change(null,status: RxStatus.empty());
 

}
void changeStep(int step){
  currentDropIndex.value = step;
  currentDrop = drops[currentDropIndex.value];
  loadLines('${currentDrop.shipmentDropId}');
}
  @override
  void onInit() async {
    customerCode = argumentData;

       await  loadData(false);
  timer = Timer.
          periodic(const Duration(seconds: 10), (Timer t) => loadData(true));
  super.onInit();
  }

    Future<void> makePhoneCall(String? phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
@override
  void dispose() {
      timer?.cancel();
    super.dispose();
  }
void logout(){
  Get.offAllNamed(Routes.LOGIN);
}
bool _isArrived = false;
Future<void> loadData(bool canNotify) async {

    try {

      change(null,status: RxStatus.loading());
       currentShiptment  = (await _logitrackApiService.getShiptment(customerCode)).first;
     if(currentShiptment==null) {
        change(null,status: RxStatus.empty());
        return;
      } 
     var dropsResponse  = (await _logitrackApiService.getShiptmentDrop(currentShiptment!.shipmentNumber.toString(),'${currentShiptment!.customer}'));
     
     if(dropsResponse.any((element) => element.arrivedAt!=null)){
        dropStatus = DropStatus.Arrived;
     }
    if(dropsResponse.every((element) => element.dropStatus! >= 3)){
        dropStatus = DropStatus.Complete;
        timer?.cancel();
     }
      if(canNotify&&drops.isEmpty&&dropsResponse.isNotEmpty){
        _notificationService.showNotification(0, 'Aviso', 'Tiene (${dropsResponse.length}) pedido(s) en ruta. ', 1);
        //timer?.cancel();
      }
      if(canNotify && !_isArrived && drops.every((element) => element.arrivedAt == null) &&dropsResponse.any((element) => element.arrivedAt!=null)){
         _notificationService.showNotification(0, 'Warning', 'Truck has arrived! ', 1);
         //timer?.cancel();
         _isArrived = true;
      }
       drops.value = dropsResponse;
      if(drops.isEmpty)
      {
        change(null,status: RxStatus.empty());
      }
      change(drops,status: RxStatus.success());
      changeStep(currentDropIndex.value);
    } catch (e) 
    {
      change(null,status: RxStatus.error(e.toString()));
    }
    update();
  }
  Future<void> loadLines(String dropId) async {

    try {
      change(null,status: RxStatus.loading());
     lines  = await _logitrackApiService.getShiptmentDropLines(dropId);
      if(lines.isEmpty)
      {
        change(null,status: RxStatus.empty());
      }
      change(lines,status: RxStatus.success());
    } catch (e) 
    {
      change(e.toString(),status: RxStatus.error());
    }

  }
}

