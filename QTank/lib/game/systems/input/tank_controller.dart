import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:qtank/game/componets/tank/tank.dart';
import '../../tank_game.dart';

class TankController extends Component
    with KeyboardHandler, HasGameRef<TankGame> {

  final Tank tank;

  // Các phím đang được nhấn
  bool up = false;
  bool down = false;
  bool left = false;
  bool right = false;

  TankController(this.tank);

  @override
  bool onKeyEvent(
      KeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    up = keysPressed.contains(LogicalKeyboardKey.keyW);
    down = keysPressed.contains(LogicalKeyboardKey.keyS);
    left = keysPressed.contains(LogicalKeyboardKey.keyA);
    right = keysPressed.contains(LogicalKeyboardKey.keyD);

    return true; // cho phép Flame nhận event
  }

  @override
  void update(double dt) {
    const speed = 120.0;

    if (up) {
      tank.position += Vector2(0, -speed) * dt;
    }
    if (down) {
      tank.position += Vector2(0, speed) * dt;
    }

    // Xoay
    if (left) {
      tank.angle -= 2 * dt;
    }
    if (right) {
      tank.angle += 2 * dt;
    }
  }
}
