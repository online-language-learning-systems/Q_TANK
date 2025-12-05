import 'package:flutter_bloc/flutter_bloc.dart';
import 'socket_bloc.dart';

abstract class RoomState {}
class RoomInitial extends RoomState {}
class RoomWaiting extends RoomState {}
class RoomJoined extends RoomState {}

abstract class RoomEvent {}
class CreateRoom extends RoomEvent {}
class JoinRoom extends RoomEvent {
  final String roomId;
  JoinRoom(this.roomId);
}

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final SocketBloc socketBloc;

  RoomBloc({required this.socketBloc}) : super(RoomInitial()) {

    /// CREATE ROOM → vào game luôn (test mode)
    on<CreateRoom>((event, emit) {
      socketBloc.socket?.emit('create_room');
      emit(RoomJoined()); // 🔥 vào game ngay
    });

    /// JOIN ROOM → vào luôn
    on<JoinRoom>((event, emit) {
      socketBloc.socket?.emit('join_room', event.roomId);
      emit(RoomJoined()); // 🔥 vào game ngay
    });
  }
}
