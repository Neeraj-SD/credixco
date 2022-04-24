import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

import '../core/network/network_info.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final NetworkInfo networkInfo;
  late Stream<InternetConnectionStatus> status;
  InternetCubit(this.networkInfo) : super(InternetInitial()) {
    status = networkInfo.connectionStatus;
    _listenToNetwork();
  }

  void _listenToNetwork() {
    status.listen((InternetConnectionStatus event) {
      if (event == InternetConnectionStatus.connected) emit(Connected());
      if (event == InternetConnectionStatus.disconnected) emit(Disconnected());
    });
  }
}
