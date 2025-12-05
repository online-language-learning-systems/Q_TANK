import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketState {}
class SocketDisconnected extends SocketState {}
class SocketConnecting extends SocketState {}
class SocketConnected extends SocketState {}

abstract class SocketEvent {}
class ConnectSocket extends SocketEvent {}

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  IO.Socket? socket;

  SocketBloc() : super(SocketDisconnected()) {
    on<ConnectSocket>((event, emit) {
      emit(SocketConnecting());

      socket = IO.io("http://10.0.2.2:3000",
          IO.OptionBuilder().setTransports(['websocket']).build());

      socket!.onConnect((_) => emit(SocketConnected()));
    });
  }
}
