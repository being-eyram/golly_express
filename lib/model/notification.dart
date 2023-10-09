//  notifications model

import 'package:golly_express/constants.dart';

class Notifications {
  Notifications({
    this.notificationTitle,
    this.notificationSubitle,
  });

  String? notificationTitle;
  String? notificationSubitle;
}

Notifications notification1 = Notifications(
  notificationTitle: sampleNotificationTitle,
  notificationSubitle: sampleNotificationSubtitle,
);
Notifications notification2 = Notifications(
  notificationTitle: sampleNotificationTitle,
  notificationSubitle: sampleNotificationSubtitle,
);
Notifications notification3 = Notifications(
  notificationTitle: sampleNotificationTitle,
  notificationSubitle: sampleNotificationSubtitle,
);
Notifications notification4 = Notifications(
  notificationTitle: sampleNotificationTitle,
  notificationSubitle: sampleNotificationSubtitle,
);
var recentNotifications = [
  notification1,
  notification2,
  notification3,
  notification4,
];
