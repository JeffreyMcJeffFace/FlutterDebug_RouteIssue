import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'debug_state.dart';

class DebugCubit extends Cubit<DebugState> {
  DebugCubit() : super(const DebugState([]));

  void addRoute(String newRoute) {
    var newRouteHistory = state.routeHistory;
    newRouteHistory.insert(0, newRoute);
    emit(DebugState(newRouteHistory));
  }
}
