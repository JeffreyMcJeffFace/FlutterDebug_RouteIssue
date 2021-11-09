part of 'debug_cubit.dart';

class DebugState extends Equatable {
  const DebugState(this.routeHistory);

  final List<String> routeHistory;

  @override
  List<Object> get props => [routeHistory];
}
