import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:full_ecommerce/controller/orders/pending_controller.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
}

fcmconfig() {
  print("==========اشعار==========");
  FirebaseMessaging.onMessage.listen((message) {
    print("==========اشعار==========");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });

  refreshPageNotification(data) {
    if (Get.currentRoute == "/orderspending" &&
        data['pagename'] == "refreshOrder") {
      PendingController controller = Get.find();
      controller.refreshOrder();
    }
    ;
  }
}
