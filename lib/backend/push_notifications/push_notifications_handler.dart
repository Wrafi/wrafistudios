import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).black600,
          child: Center(
            child: Image.asset(
              'assets/images/fijek_4.png',
              width: 200.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'home': ParameterData.none(),
  'Portfolio': ParameterData.none(),
  'AboutMe': ParameterData.none(),
  'profile': ParameterData.none(),
  'Onboarding1': ParameterData.none(),
  'Admin': ParameterData.none(),
  'portfolioDetails': (data) async => ParameterData(
        allParams: {
          'portfolioDetails': await getDocumentParameter<PortfolioRecord>(
              data, 'portfolioDetails', PortfolioRecord.fromSnapshot),
        },
      ),
  'editProfile': ParameterData.none(),
  'serviceDetails': (data) async => ParameterData(
        allParams: {
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.fromSnapshot),
        },
      ),
  'AuthenticateSolo1': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'createRequest': ParameterData.none(),
  'successRequest': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'addService': ParameterData.none(),
  'addPortfolio': ParameterData.none(),
  'editPortfolio': (data) async => ParameterData(
        allParams: {
          'document': await getDocumentParameter<PortfolioRecord>(
              data, 'document', PortfolioRecord.fromSnapshot),
        },
      ),
  'UserRequests': ParameterData.none(),
  'RequestDetails': (data) async => ParameterData(
        allParams: {
          'request': await getDocumentParameter<RequestsRecord>(
              data, 'request', RequestsRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
