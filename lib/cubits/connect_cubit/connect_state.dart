abstract class ConnectState {}

class ConnectInitial extends ConnectState {}

class ConnectLoading extends ConnectState {}

class ConnectLoaded extends ConnectState {}



class ConnectError extends ConnectState {
  final String error;

 ConnectError({required this.error});
}
