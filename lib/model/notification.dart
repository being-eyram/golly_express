//  notifications model

class Notification {
  Notification({
    this.notificationTitle,
    this.notificationSubitle,
  });

  final String? notificationTitle;
  final String? notificationSubitle;
}

var recentNotifications = [];
