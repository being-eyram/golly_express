import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String? trimToken() => contains(":") ? split(":")[1].trim() : this;
  String? trimSpaces() => replaceAll(" ", "");
  String removeSpacesAndLower() => replaceAll(' ', '').toLowerCase();
  String get first => split(" ")[0];
}

extension Greetings on String {
  String get greetFirstName {
    final hour = TimeOfDay.now().hour;
    String timeOfDay = "";
    if (hour <= 12) {
      timeOfDay = "Morning";
    } else if (hour <= 17) {
      timeOfDay = "Afternoon";
    } else {
      timeOfDay = "Evening";
    }
    return "Good $timeOfDay, ${split(" ")[0]}";
  }
}

final currentTimeProvider = Provider<DateTime>((ref) => DateTime.now());

final greetingProvider = Provider((ref) {
  // final hour = TimeOfDay.now().hour;
  final currentTime = ref.watch(currentTimeProvider);
  final hour = currentTime.hour;
  String timeOfDay = "";
  if (hour < 12) {
    timeOfDay = "Morning";
  } else if (hour < 17) {
    timeOfDay = "Afternoon";
  } else {
    timeOfDay = "Evening";
  }
  return "Good $timeOfDay";
});


  // String greeting(name) {
  //   final hour = TimeOfDay.now().hour;
  //   String timeOfDay = "";
  //   if (hour <= 12) {
  //     timeOfDay = "Morning";
  //   } else if (hour <= 17) {
  //     timeOfDay = "Afternoon";
  //   } else {
  //     timeOfDay = "Evening";
  //   }
  //   return "Good $timeOfDay, ${name.split(" ")[0]}";
  // }