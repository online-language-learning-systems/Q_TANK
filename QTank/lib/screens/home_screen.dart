import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtank/game/tank_game.dart';
import '../blocs/index.dart';
import 'package:flame/game.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController roomIdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final socketBloc = context.read<SocketBloc>();
    final roomBloc = context.read<RoomBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("Qtank Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// SOCKET STATE
            BlocBuilder<SocketBloc, SocketState>(
              builder: (context, state) {
                if (state is SocketDisconnected) {
                  return ElevatedButton(
                    onPressed: () => socketBloc.add(ConnectSocket()),
                    child: Text("Kết nối Socket"),
                  );
                }
                if (state is SocketConnecting) {
                  return const Text("Đang kết nối…");
                }
                return const Text("Đã kết nối!");
              },
            ),

            const SizedBox(height: 20),

            /// ROOM STATE
            BlocBuilder<RoomBloc, RoomState>(
              builder: (context, state) {
                if (state is RoomInitial) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => roomBloc.add(CreateRoom()),
                        child: Text("Tạo phòng"),
                      ),
                      TextField(
                        controller: roomIdCtrl,
                        decoration: InputDecoration(
                          labelText: "Nhập mã phòng",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            roomBloc.add(JoinRoom(roomIdCtrl.text)),
                        child: Text("Tham gia phòng"),
                      ),
                    ],
                  );
                }

                if (state is RoomWaiting) {
                  return const Text("Đợi người chơi khác…");
                }

                if (state is RoomJoined) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GameWidget(game: TankGame()),
                        ),
                      );
                    },
                    child: const Text("Vào game"),
                  );
                }

                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
