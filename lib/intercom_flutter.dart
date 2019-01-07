library intercom_flutter;

import 'dart:async';

import 'package:flutter/services.dart';

enum IntercomLauncherVisibility { gone, visible }

class Intercom {
  static const MethodChannel _channel =
      const MethodChannel('app.getchange.com/intercom');

  static Future<dynamic> initialize(String appId,
      {String androidApiKey, String iosApiKey}) {
    return _channel.invokeMethod('initialize', {
      'appId': appId,
      'androidApiKey': androidApiKey,
      'iosApiKey': iosApiKey
    });
  }

  static Future<dynamic> registerIdentifiedUser(String userId) {
    return _channel.invokeMethod('registerIdentifiedUser', {'userId': userId});
  }

  static Future<dynamic> registerUnidentifiedUser() {
    return _channel.invokeMethod('registerUnidentifiedUser');
  }

  static Future<dynamic> updateUser(
      {String email,
      String name,
      String phone,
      String company,
      String companyId,
      String userId,
      Map<String, dynamic> customAttributes}) {
    return _channel.invokeMethod('updateUser', <String, dynamic>{
      'email': email,
      'name': name,
      'phone': phone,
      'company': company,
      'companyId': companyId,
      'userId': userId,
      'customAttributes': customAttributes
    });
  }

  static Future<dynamic> logout() {
    return _channel.invokeMethod('logout');
  }

  static Future<dynamic> setLauncherVisibility(
      IntercomLauncherVisibility visibility) {
    String visibilityString =
        visibility == IntercomLauncherVisibility.visible ? 'VISIBLE' : 'GONE';
    return _channel.invokeMethod(
        'setLauncherVisibility', {'visibility': visibilityString});
  }

  static Future<dynamic> displayMessenger() {
    return _channel.invokeMethod('displayMessenger');
  }

  static Future<dynamic> displayHelpCenter() {
    return _channel.invokeMethod('displayHelpCenter');
  }

  static Future<dynamic> setInAppMessageVisibility() {
    return _channel.invokeMethod('setInAppMessageVisibility');
  }

  static Future<dynamic> getUnreadConversationCount() {
    return _channel.invokeMethod('getUnreadConversationCount');
  }
}
