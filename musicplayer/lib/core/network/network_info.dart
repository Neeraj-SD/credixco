import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Stream<InternetConnectionStatus> get connectionStatus;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});

  @override
  Stream<InternetConnectionStatus> get connectionStatus =>
      connectionChecker.onStatusChange;
}
