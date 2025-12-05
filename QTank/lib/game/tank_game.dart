import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:qtank/game/componets/tank/tank.dart';
import 'package:qtank/game/systems/input/tank_controller.dart';

class TankGame extends FlameGame
    with HasKeyboardHandlerComponents {

  late Tank playerTank;

  @override
  Future<void> onLoad() async {
    playerTank = Tank(position: Vector2(200, 200));
    add(playerTank);

    // Thêm controller xử lý input
    add(TankController(playerTank));
  }
}

