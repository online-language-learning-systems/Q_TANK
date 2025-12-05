import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect() {
    socket = IO.io('http://your-server-ip:3000', {
      'transports': ['websocket'],
    });

    socket.onConnect((_) => print("Connected"));
  }

  void sendTankPosition(x, y, angle) {
    socket.emit('tank_move', {
      'x': x,
      'y': y,
      'angle': angle,
    });
  }

  void listenEnemyMove(Function callback) {
    socket.on('enemy_move', (data) => callback(data));
  }
}
